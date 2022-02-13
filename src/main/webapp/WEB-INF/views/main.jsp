<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JANIBOT</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="text/javascript">
        const token = "1899fa7bb24549e43d567d256a52abed";
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init(token);
        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());

        window.addEventListener("load", ev => {
            // 사용자 정보를 가져옵니다.
            Kakao.API.request({
                url: '/v2/user/me',
                success: function(response) {
                    console.log(response);
                    // 토큰 할당
                },
                fail: function(error) {
                    console.log(error);
                }
            });

            // 프로필 정보를 가져옵니다.
            Kakao.API.request({
                url: '/v1/api/talk/profile',
                success: function(response) {
                    console.log('profile: ', response);
                },
                fail: function(error) {
                    console.log('profile: ', error);
                }
            });
        });

        function friendsListWithKakao() {
            Kakao.API.request({
                url: '/v1/api/talk/friends',
                success: function(response) {
                    console.log('freinds: ', response);
                },
                fail: function(error) {
                    console.log('freinds: ', error);
                }
            });
        }
    </script>
</head>
<body>
<p>로그인 성공</p>
<a id="custom-login-btn" href="javascript:friendsListWithKakao()">
    친구목록
</a>
</body>
</html>