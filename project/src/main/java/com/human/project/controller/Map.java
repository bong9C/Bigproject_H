package com.human.project.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpHeaders;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriUtils;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;


public class Map {
    public static void main(String[] args) {
        // 예
        String[] map = {"테니스장"};
        String addr = "서울시 영등포구";

        // 고객이 입력한 상품을 파는 매장을 리스트로 가져오기
        String[] mapList = map;

        // 고객이 입력한 주소 ['시', '구'] 또는 ['군', '면', '리'] 가져오기
        String[] addrList = addr.split(" ");
        String[] addrList1 = new String[]{};
        String[] addrList2 = new String[]{};
        for (String i : addrList) {
            if (i.endsWith("시") || i.endsWith("구")) {
                addrList1 = append(addrList1, i);
            } else if (i.endsWith("군") || i.endsWith("면") || i.endsWith("리")) {
                addrList2 = append(addrList2, i);
            }
        }

        String addr1 = String.join(" ", addrList1);
        String addr2 = String.join(" ", addrList2);

        String addrFinal = (addr1.equals("")) ? addr2 : addr1;
        System.out.println(addrFinal);

        // 고객이 입력한 주소 좌표 구하기
        try {
            // 주소에 맞는 카카오 API 키를 사용하여 좌표 정보 가져오기
            // (주의: 여기서는 API 키를 파일에서 직접 읽어오는 코드가 없으므로 추가해야 합니다.)
            String kakaoKey = "c6b27e1d768a1a823a35af5fd06825e0";
            String base_url = "https://dapi.kakao.com/v2/local/search/address.json";
            String url = base_url + "?query=" + UriUtils.encode(addrFinal, StandardCharsets.UTF_8);
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "KakaoAK " + kakaoKey);
            HttpEntity<String> entity = new HttpEntity<>(headers);
            ResponseEntity<String> response = new RestTemplate().exchange(url, HttpMethod.GET, entity, String.class);

            JSONObject json = new JSONObject(response.getBody());
            double lat = json.getJSONArray("documents").getJSONObject(0).getDouble("y");
            double lng = json.getJSONArray("documents").getJSONObject(0).getDouble("x");

            System.out.println("Latitude: " + lat + ", Longitude: " + lng);
        } catch (Exception e) {
            System.out.println("주소 형식이 올바르지 않습니다.");
        }

        // 네이버 플레이스 Selenium으로 들어가기
        String nPlaceUrl = "https://m.place.naver.com/place/list?x=" + lng + "&y=" + lat + "&query=" + map[0];
        WebDriver driver = new ChromeDriver();
        driver.get(nPlaceUrl);

        // '목록보기' 클릭
        WebElement filter = driver.findElement(By.xpath("//*[@id=\"_place_portal_root\"]/div/a"));
        filter.click();
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // '거리순' 클릭
        WebElement shortWay = driver.findElement(By.xpath("//*[@id=\"_list_scroll_container\"]/div/div/div[1]/div/div/div/span[2]/a"));
        shortWay.click();
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // '상세 주소 화살표' 클릭
        try {
            List<WebElement> jusoWay = driver.findElements(By.className("uFxr1"));
            jusoWay.get(0).click();
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            System.out.println("근처에 매장이 없습니다.");
        }

        // 마켓 정보 불러오기
        Document doc = Jsoup.parse(driver.getPageSource());
        Element mapListElement = doc.selectFirst("ul.eDFz9");
        Element map1 = mapListElement.selectFirst("li");
        List<Element> results = new ArrayList<>();

        // 현재 위치에서 마켓 거리
        String mDistance = map1.selectFirst("span.lWwyx.NVngW").text().split("서")[1];

        // 마켓 이름
        String mTitle = map1.selectFirst("span.place_bluelink.YwYLL").text();

        // 마켓 도로명 주소
        String mAddr;
        if (map1.selectFirst("div.zZfO1").text().startsWith("지번")) {
            mAddr = map1.selectFirst("div.zZfO1").text().substring(2, map1.selectFirst("div.zZfO1").text().length() - 2);
        } else {
            mAddr = map1.selectFirst("div.zZfO1").text().substring(3, map1.selectFirst("div.zZfO1").text().length() - 2);
        }

        // 딕셔너리 형태로 저장
        Map<String, String> mapData = new HashMap<>();
        mapData.put("거리", mDistance);
        mapData.put("매장명", mTitle);
        mapData.put("주소", mAddr);

        // 딕셔너리 형태로 저장한 것을 리스트에 저장 (3가지 마켓을 넣어야 하므로)
        results.add(mapData);
        System.out.println(results);
    }

    private static String[] append(String[] arr, String element) {
        String[] newArr = Arrays.copyOf(arr, arr.length + 1);
        newArr[arr.length] = element;
        return newArr;
    }
}