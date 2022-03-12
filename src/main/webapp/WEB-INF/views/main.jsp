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

        window.addEventListener('load', ev => {
            // 로그인 성공 토큰이 없다면 로그인 화면으로 돌아갑니다.
            if (!Kakao.Auth.getAccessToken()) {
                window.location = location.origin;
            } else {
                console.log(Kakao.Auth.getAccessToken());
            }

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

            // 공유하기 버튼
            Kakao.Link.createDefaultButton({
                container: '#kakao-link-btn',
                objectType: 'text',
                text:
                    '기본 템플릿으로 제공되는 텍스트 템플릿은 텍스트를 최대 200자까지 표시할 수 있습니다. 텍스트 템플릿은 텍스트 영역과 하나의 기본 버튼을 가집니다. 임의의 버튼을 설정할 수도 있습니다. 여러 장의 이미지, 프로필 정보 등 보다 확장된 형태의 카카오링크는 다른 템플릿을 이용해 보낼 수 있습니다.',
                link: {
                    mobileWebUrl:
                        'https://developers.kakao.com',
                    webUrl:
                        'https://developers.kakao.com',
                },
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
                    // 친구 목록을 표로 나타냅니다.
                    // 지금은.. 팀에 친구가 없음.
                    document.getElementById('total_count').innerText = response.total_count;

                    var template = document.getElementById("profile").innerHTML;
                    response.elements.forEach(friend => {
                        document.getElementById('friend_list').append(
                            template.replace('{profile_thumbnail_image}', friend.profile_thumbnail_image)
                                .replace('{id}', friend.id)
                                .replace('{uuid}', friend.uuid)
                                .replace('{profile_nickname}', friend.profile_nickname)
                        );
                    });
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
            Kakao.Auth.logout(function () {
                window.location = location.origin;
            });
        }

        function RUUp() {

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

<div><button id="kakao-link-btn">메시지 보내기 테스트</button></div>

<div>
    <p>총 <span id="total_count">0</span>명</p>
    <div id="friend_list"></div>
</div>

<%-- 프로필 템플릿 --%>
<script type="rv-template" id="profile">
    <div>
        <img alt="profile_image" src="{profile_thumbnail_image}" height="80px" width="80px"/>
        <div class="friend-info-div" style="display: inline-block;">
            <table>
                <tbody>
                <tr>
                    <td class="table-header">ID</td>
                    <td>{id}</td>
                </tr>
                <tr>
                    <td class="table-header">UUID</td>
                    <td>{uuid}</td>
                </tr>
                <tr>
                    <td class="table-header">닉네임</td>
                    <td>{profile_nickname}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <button onclick="RUUp()">자니?</button>
    </div>
</script>
</body>
</html>