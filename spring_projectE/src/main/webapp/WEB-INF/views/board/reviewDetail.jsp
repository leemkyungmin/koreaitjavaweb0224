<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main class="ReviewDetailPage">
  
  <section class="ReviewCard ReviewDetailPage__ReviewCard">
    <header class="ReviewCard__Header">
      <div class="ReviewCard__User">
        <i class="ReviewCard__UserPicture" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/955524_1577464846329?fit=around|56:56&amp;crop=56:56;*,*&amp;output-format=jpg&amp;output-quality=80'), url('https://mp-seoul-image-production-s3.mangoplate.com/web/resources/jmcmlp180qwkp1jj.png?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80')">
        </i>
        <div class="ReviewCard__UserInfo">
          <p class="ReviewCard__UserNameWrap">
            <span class="ReviewCard__UserName">${rdto.cNickname }</span>
          </p>

          
        </div>
      </div>

     
    </header>

    
    <p class="ReviewCard__ReviewText">
      	${rdto.rTitle } <br/>
      	${rdto.rContent }
    </p>


      <div class="ReviewCard__ReviewPictureContainer">
        <div class="ReviewCard__ReviewPictureSlider">
            <div class="ReviewCard__ReviewPicture" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/955524_1591537215014637.jpg?fit=around|200:200&amp;crop=200:200;*,*&amp;output-format=jpg&amp;output-quality=80'), url('https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80')" data-index="0" onclick="trackEvent('CLICK_PICTURE', {position: 0}.to_json)">
            </div>
            <div class="ReviewCard__ReviewPicture" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/955524_1591537221523969.jpg?fit=around|200:200&amp;crop=200:200;*,*&amp;output-format=jpg&amp;output-quality=80'), url('https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80')" data-index="1" onclick="trackEvent('CLICK_PICTURE', {position: 1}.to_json)">
            </div>
            <div class="ReviewCard__ReviewPicture" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/955524_1591537222614573.jpg?fit=around|200:200&amp;crop=200:200;*,*&amp;output-format=jpg&amp;output-quality=80'), url('https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80')" data-index="2" onclick="trackEvent('CLICK_PICTURE', {position: 2}.to_json)">
            </div>
            <div class="ReviewCard__ReviewPicture" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/955524_1591537223817493.jpg?fit=around|200:200&amp;crop=200:200;*,*&amp;output-format=jpg&amp;output-quality=80'), url('https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80')" data-index="3" onclick="trackEvent('CLICK_PICTURE', {position: 3}.to_json)">
            </div>
            <div class="ReviewCard__ReviewPicture" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/955524_1591537224282427.jpg?fit=around|200:200&amp;crop=200:200;*,*&amp;output-format=jpg&amp;output-quality=80'), url('https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80')" data-index="4" onclick="trackEvent('CLICK_PICTURE', {position: 4}.to_json)">
            </div>
            <div class="ReviewCard__ReviewPicture" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/955524_1591537224817820.jpg?fit=around|200:200&amp;crop=200:200;*,*&amp;output-format=jpg&amp;output-quality=80'), url('https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80')" data-index="5" onclick="trackEvent('CLICK_PICTURE', {position: 5}.to_json)">
            </div>
            <div class="ReviewCard__ReviewPicture" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/955524_1591537225741894.jpg?fit=around|200:200&amp;crop=200:200;*,*&amp;output-format=jpg&amp;output-quality=80'), url('https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80')" data-index="6" onclick="trackEvent('CLICK_PICTURE', {position: 6}.to_json)">
            </div>
            <div class="ReviewCard__ReviewPicture" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/955524_1591537226808951.jpg?fit=around|200:200&amp;crop=200:200;*,*&amp;output-format=jpg&amp;output-quality=80'), url('https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80')" data-index="7" onclick="trackEvent('CLICK_PICTURE', {position: 7}.to_json)">
            </div>
            <div class="ReviewCard__ReviewPicture" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/955524_1591537227404965.jpg?fit=around|200:200&amp;crop=200:200;*,*&amp;output-format=jpg&amp;output-quality=80'), url('https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80')" data-index="8" onclick="trackEvent('CLICK_PICTURE', {position: 8}.to_json)">
            </div>
        </div>
      </div>

    <footer class="ReviewCard__Footer">
      <span class="ReviewCard__RegistrationDate">${rdto.rWriter_date }</span>
    </footer>
  </section>
</main>

</body>
</html>