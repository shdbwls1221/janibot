<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JANIBOT</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        const token = "1899fa7bb24549e43d567d256a52abed";
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init(token);

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>

    <script type="text/javascript">
        // 카카오톡으로 로그인합니다.
        function loginWithKakao() {
            Kakao.Auth.login({
                success: function(authObj) {
                    // alert("SUCCESS: " + JSON.stringify(authObj));
                    // 로그인 성공 시, 토큰을 할당해줍니다.
                    Kakao.Auth.setAccessToken(authObj.access_token);
                    Kakao.Auth.authorize({
                        redirectUri: location.origin + "/main"
                    });
                },
                fail: function(err) {
                    alert("ERR: " + JSON.stringify(err))
                },
            })
        }
    </script>
</head>
<body>
<a id="custom-login-btn" href="javascript:loginWithKakao()">
    <img src="../../resouurce/image/kakao_login_large_narrow.png" width="366" alt="카카오 로그인 버튼" />
</a>
</body>
</html>