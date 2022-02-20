<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        if (!Kakao.Auth.getAccessToken()) {
            window.location = location.origin;
        } else {
            console.log(Kakao.Auth.getAccessToken());
        }

        window.addEventListener('load', ev => {
            // 사용자 정보를 가져옵니다.
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
                    console.log('me: ', response);
                    document.getElementById('nickname').innerText = response.kakao_account.profile.nickname;
                    document.getElementById('profile_image').setAttribute('src', response.kakao_account.profile.profile_image_url);
                },
                fail: function (error) {
                    console.log('me: ', error);
                }
            });

            // 프로필 정보를 가져옵니다.
            // Kakao.API.request({
            //     url: '/v1/api/talk/profile',
            //     success: function(response) {
            //         console.log('profile: ', response);
            //         document.getElementById('nickname').innerText = response.nickName;
            //     },
            //     fail: function(error) {
            //         console.log('profile: ', error);
            //     }
            // });

            // 동의 내역을 확인합니다.
            Kakao.API.request({
                url: '/v2/user/scopes',
                success: function (response) {
                    console.log('scopes: ', response);
                },
                fail: function (error) {
                    console.log('scopes: ', error);
                }
            });
        });

        /**
         * 친구목록을 가져옵니다.
         */
        function friendsWithKakao() {
            // 친구 목록 가져오기
            Kakao.API.request({
                url: '/v1/api/talk/friends',
                success: function (response) {
                    console.log('freinds: ', response);
                },
                fail: function (error) {
                    console.log('freinds: ', error);
                }
            });
        }

        /**
         * 로그아웃 합니다.
         */
        function logoutWithKakao() {
            Kakao.Auth.logout(function() {
                window.location = location.origin;
            });
        }
    </script>
</head>
<body>
<p>로그인 성공</p>
<div>
    <div><img id="profile_image" alt="profile_image" src="" height="100px" width="100px"/></div>
    <div> 닉네임 : <span id="nickname"></span></div>

</div>
<a id="friends" href="javascript:friendsWithKakao()">친구목록</a> &nbsp;
<a id="logout" href="javascript:logoutWithKakao()">로그아웃</a>
</body>
</html>