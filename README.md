
# ALL EARs _ Music SNS
### ALL EARs = all ; 모든 + ear ; 귀,청각 (의)
국내외 아티스트들의 커뮤니케이션, 대중과의 음악적 소통을 위한 타임라인 SNS

## 기획 의도

  Song Camp의 비용적 한계와 식지 않는 K-POP 열풍을 SNS에 접목
  - 새로운 아티스트와의 협업 가능
  - 신인 작곡가 발굴
  - 온라인으로 소통 가능

## 주요 기능
  - 데모곡 업로드 (영상 업로드 가능)
  - 선호하는 아티스트 팔로우 가능 
  - 협업을 원하는 아티스트에게 방명록 작성 (답글형 게시판)

## 개발환경
  - JDK : 1.8
  - IDE : Eclipse EE
  - Server :: Apache Tomcat
  - Framework : Spring MVC
  - DB : Oracle 11g / mybaits
  - Maven Project
  
## 구현 화면
### 로그인 전 화면 / 로그인 / 회원가입
![main](https://user-images.githubusercontent.com/33610328/41815724-3ecd4a3a-77ae-11e8-802d-a7a6ec246c79.png)
![login](https://user-images.githubusercontent.com/33610328/41815725-4ac193e6-77ae-11e8-9d30-4b174ab2c8fa.png)
![join](https://user-images.githubusercontent.com/33610328/41815726-4e4d48d4-77ae-11e8-9d48-8edf395b30f2.png)
### 로그인 후, 사용자가 팔로우한 아티스트들의 곡이 시간순으로 보여짐.
![main2](https://user-images.githubusercontent.com/33610328/41815728-55ba3fb4-77ae-11e8-9e11-5a6140f25187.png)
### 마이 페이지, 사용자가 업로드한 곡
![mypage](https://user-images.githubusercontent.com/33610328/41815729-66a8737c-77ae-11e8-8a65-ee8bbc743d28.png)
### admin 로그인 시, 오른쪽 상단바 회원관리 버튼 추가
![admin](https://user-images.githubusercontent.com/33610328/41815730-69d6bd60-77ae-11e8-931a-33a131195512.png)
### 친구 페이지, 팔로우 전
![friend1](https://user-images.githubusercontent.com/33610328/41815731-6bccb9d0-77ae-11e8-8d19-e2a7c25daa2b.png)
### 친구 페이지, 팔로우 후 
![friend2](https://user-images.githubusercontent.com/33610328/41815732-6eae35ac-77ae-11e8-9e9d-09a7d34d7038.png)
### 회원 목록
![userlist](https://user-images.githubusercontent.com/33610328/41815734-74d4d152-77ae-11e8-8de1-02c18a041cf7.png)
### 음원 목록
![songlist](https://user-images.githubusercontent.com/33610328/41815736-7966d3b4-77ae-11e8-8431-a2e200f172d1.png)
### 음원 업로드
![songupload](https://user-images.githubusercontent.com/33610328/41815737-7c827c06-77ae-11e8-844d-d351adba3a56.png)
### 음원 확인
![songcontent](https://user-images.githubusercontent.com/33610328/41815738-7fdf37b8-77ae-11e8-91ae-830575104838.png)
### 방명록 목록
![guestlist](https://user-images.githubusercontent.com/33610328/41815740-842b46d6-77ae-11e8-8acf-24a3cdc98fdb.png)
### 방명록 작성
![write](https://user-images.githubusercontent.com/33610328/41815741-87ee2cb6-77ae-11e8-8aaa-511120818a15.png)
### 방명록 확인
![guestcontent](https://user-images.githubusercontent.com/33610328/41815742-8b1a7f66-77ae-11e8-9017-78bf11fac86c.png)
### 회원 정보 수정
![update](https://user-images.githubusercontent.com/33610328/41815744-8eb46f4c-77ae-11e8-9b66-7997d8392de1.png)
### 부가정보 (프로필 사진 / sns) 
![etcform](https://user-images.githubusercontent.com/33610328/41815745-90efbc44-77ae-11e8-8c5b-89f563ebea63.png)
### 회원 탈퇴
![delete](https://user-images.githubusercontent.com/33610328/41815747-93d6ef7c-77ae-11e8-9418-4df7e826000f.png)

## DB
### 타임라인 
~~~java
<select id="getTimeline" parameterType="hashmap" resultType="Time">
	select e.profilename, f.friendid, u.displayname, u.position, s.* from etcInfo e, follow f, userlist u, songboard s 
	where u.userid=f.friendid and e.etcid=f.friendid and s.sboardid=f.friendid and f.myid=#{myid} order by s.snum desc
</select>
~~~

## web.xml
~~~java
<?xml version="1.0" encoding="EUC-KR"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xmlns:jsp="http://java.sun.com/xml/ns/javaee/jsp" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
  <display-name>AllEars</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
 
  
  <servlet>
    <servlet-name>AllEars</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <load-on-startup>1</load-on-startup>
  </servlet>
  
  
  <servlet-mapping>
    <servlet-name>AllEars</servlet-name>
    <url-pattern>/</url-pattern>
  </servlet-mapping>
  
  <servlet-mapping>
    <servlet-name>default</servlet-name>
    <url-pattern>*.jpg</url-pattern>
     <url-pattern>*.css</url-pattern>
     <url-pattern>*.png</url-pattern>
     <url-pattern>*.mp4</url-pattern>
     <url-pattern>*.wav</url-pattern>
     <url-pattern>*.mp3</url-pattern>
  </servlet-mapping>
  
  
  <filter> 
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>UTF-8</param-value>
    </init-param>
  </filter>
  <filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>/*</url-pattern>
  </filter-mapping>
  
 
 </web-app>
 ~~~
 
 ## AllEars-servlet.xml
 ~~~java
 <?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans" 
xmlns:mvc="http://www.springframework.org/schema/mvc"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.springframework.org/schema/beans 
http://www.springframework.org/schema/beans/spring-beans.xsd
http://www.springframework.org/schema/mvc
http://www.springframework.org/schema/mvc/spring-mvc.xsd">
	
		
	<mvc:annotation-driven/>
	<mvc:view-controller path="/index" view-name="index"/>
	<mvc:default-servlet-handler/>
	
	<bean class="controller.BoardController"/>
	<bean id="multipartResolver" 
         class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
   	</bean> 
	
	<bean id="viewResolver" 
			class="org.springframework.web.servlet.view.InternalResourceViewResolver">
			<property name="prefix" value="/WEB-INF/view/"/>
			<property name="suffix" value=".jsp"/>
	</bean> 
</beans>
~~~



