<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/button.css">
    <title>Project_H</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        video {
            width: 100%;
            height: auto;
            position: fixed;
            top: 0;
            left: 0;
            object-fit: cover; /* 동영상이 꽉 차게 표시되도록 설정 */
        }

        .content {
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 24px;
        }
    </style>
</head>
<body>

    <video autoplay muted loop>
        <!-- 동영상 파일의 경로를 지정 -->
        <source src="videos/test.mp4" type="video/mp4">
         Your browser does not support the video tag.
    </video>

    <div class="content">
    <a href="#">
	<button class="w-btn w-btn-indigo" type="button">
        시작하기
    </button>
    </a>
    </div>
    

</body>
</html>
