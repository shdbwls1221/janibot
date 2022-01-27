package study.janibot.kakao;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class KakaoMain {

    private static KakaoRestApiHelper apiHelper = new KakaoRestApiHelper();

//    public static void main(String[] args) throws InterruptedException {
//        new KakaoMain().test();
//    }

    /**
     * 테스트가 필요한 api 블럭만 주석을 풀고 테스트하세요.
     */
    public void test() {
        // access token 지정
        apiHelper.setAccessToken("[YOUR APP KEY]");

        // 푸시 알림이나 유저 아이디 리스트가 필요할 때 설정 합니다.
        // (디벨로퍼스 내에 앱설정 메뉴를 가시면 있습니다)
        apiHelper.setAdminKey("[YOUR ADMIN KEY]");

        testUserManagement();
        testKakaoStory();
        testKakaoTalk();
        testPush();
    }

    public void testUserManagement() {

        Map<String, String> paramMap;

        /*
        // 앱 사용자 정보 요청 (signup 후에 사용 가능)
        apiHelper.me();
        */

        // 앱 연결
        // apiHelper.signup();

        /*
        // 앱 연결(파라미터)
        paramMap = new HashMap<String, String>();
        paramMap.put("properties", "{\"nickname\":\"test\"}");
        apiHelper.signup(paramMap);
        */

        // 앱 탈퇴
        //apiHelper.unlink();

        // 앱 로그아웃
        //apiHelper.logout();

        /*
        // 앱 사용자 정보 업데이트
        paramMap = new HashMap<String, String>();
        paramMap.put("properties", "{\"nickname\":\"test\"}");
        apiHelper.updatProfile(paramMap);
        */

        // 앱 사용자 리스트 요청
        //apiHelper.getUserIds();

        /*
        // 앱 사용자 리스트 요청 (파라미터)
        paramMap = new HashMap<String, String>();
        paramMap.put("limit", "100");
        paramMap.put("fromId", "1");
        paramMap.put("order", "asc");
        apiHelper.getUserIds(paramMap);
        */
    }

    public void testKakaoStory() {

        final String TEST_MYSTORY_ID = "[TEST MY STORY ID]";
        final String TEST_SCRAP_URL = "https://developers.kakao.com";

        // on Linux or Mac
        final File TEST_UPLOAD_FILE1 = new File("/xxx/sample1.png");
        final File TEST_UPLOAD_FILE2 = new File("/xxx/sample2.png");

        // on windows
        // final File TEST_UPLOAD_FILE = new File("C:\\~~/sample.png");

        Map<String, String> paramMap;

        /*
        // 스토리 프로파일 요청
        apiHelper.storyProfile();
        */

        /*
        // 스토리 유저인지 확인
        apiHelper.isStoryUser();
        */

        /*
        // 복수개의 내스토리 정보 요청
        // https://dev.kakao.com/docs/restapi#복수개의-내스토리-정보-요청
        apiHelper.getMyStories();
        */

        /*
        // 복수개의 내스토리 정보 요청 (특정 아이디 부터)
        paramMap = new HashMap<String, String>();
        paramMap.put("last_id", TEST_MYSTORY_ID);
        apiHelper.getMyStories(paramMap);
        */

        /*
        // 내스토리 정보 요청
        // https://dev.kakao.com/docs/restapi#카카오스토리-내스토리-정보-요청
        paramMap = new HashMap<String, String>();
        paramMap.put("id", TEST_MYSTORY_ID);
        apiHelper.getMyStory(paramMap);
        */

        // 내스토리 삭제
        // paramMap = new HashMap<String, String>();
        // paramMap.put("id", TEST_MYSTORY_ID);
        // apiHelper.deleteMyStory(paramMap);

        // 스토리 포스팅 공통 파라미터. 필요한 것만 선택하여 사용.
        paramMap = new HashMap<String, String>();
        paramMap.put("permission", "A"); // A : 전체공개, F: 친구에게만 공개, M: 나만보기
        paramMap.put("enable_share", "false"); // 공개 기능 허용 여부
        paramMap.put("android_exec_param", "cafe_id=1234"); // 앱 이동시 추가 파라미터
        paramMap.put("ios_exec_param", "cafe_id=1234");
        paramMap.put("android_market_param", "cafe_id=1234");
        paramMap.put("ios_market_param", "cafe_id=1234");

        // 글 포스팅일 경우에는 content는 필수지만 링크/사진 포스팅일 때는 옵션.
        paramMap.put("content", "더 나은 세상을 꿈꾸고 그것을 현실로 만드는 이를 위하여 카카오에서 앱 개발 플랫폼 서비스를 시작합니다.");

        String result;

        /*
        // 글 포스팅
        result = apiHelper.postNote(paramMap);
        if (result != null && result.indexOf("code\":-") == -1) {
            String postedId = result.split("\"")[3];
            System.out.println("postedId:" + postedId);
            if (apiHelper.deleteMyStory(postedId).equals(""))
                System.out.println("deleted test my story " + postedId);
        }
        */

        /*
        // 사진 포스팅 (최대 10개까지 가능)
        String uploadedImageObj = apiHelper.uploadMulti(
                new File[]{
                        TEST_UPLOAD_FILE1,
                        TEST_UPLOAD_FILE2
                });
        if (uploadedImageObj != null) {
            System.out.println("uploaded file(s) successfully.");
            System.out.println(uploadedImageObj);
            paramMap.put("image_url_list", uploadedImageObj);
            result = apiHelper.postPhoto(paramMap);
            if (result != null && result.indexOf("code\":-") == -1) {
                String postedId = result.split("\"")[3];
                System.out.println("postedId:" + postedId);
                if (apiHelper.deleteMyStory(postedId).equals(""))
                    System.out.println("deleted test my story " + postedId);
            }

        } else {
            System.out.println("failed to upload");
        }
        */

        /*
        // 링크 포스팅
        final String linkInfoObj = apiHelper.getLinkInfo(TEST_SCRAP_URL);
        if (linkInfoObj != null) {
            paramMap.put("link_info", linkInfoObj);
            result = apiHelper.postLink(paramMap);
            if (result != null && result.indexOf("code\":-") == -1) {
                String postedId = result.split("\"")[3];
                System.out.println("postedId:" + postedId);
                if (apiHelper.deleteMyStory(postedId).equals(""))
                    System.out.println("deleted test my story " + postedId);
            }
        }
        */

    }

    public void testKakaoTalk() {

        // 카카오톡 프로필 요청
        apiHelper.talkProfile();
    }

    public void testPush() {

        Map<String, String> paramMap;

        // 파라미터 설명
        // @param uuid 사용자의 고유 ID. 1~(2^63 -1), 숫자가만 가능
        // @param push_type  gcm or apns
        // @param push_token apns(64자) or GCM으로부터 발급받은 push token
        // @param uuids 기기의 고유한 ID 리스트 (최대 100개까지 가능)

        // 푸시 알림 관련 API를 테스트하시려면 admin key 지정해야 합니다.

        /*
        // 푸시 등록
        paramMap = new HashMap<String, String>();
        paramMap.put("uuid", "10000");
        paramMap.put("push_type", "gcm");
        paramMap.put("push_token", "xxxxxxxxxx");
        paramMap.put("device_id", "");
        apiHelper.registerPush(paramMap);
        */

        /*
        // 푸시 토큰 조회
        paramMap = new HashMap<String, String>();
        paramMap.put("uuid", "10000");
        apiHelper.getPushTokens(paramMap);
        */

        /*
        // 푸시 해제
        paramMap = new HashMap<String, String>();
        paramMap.put("uuid", "10000");
        paramMap.put("push_type", "gcm");
        paramMap.put("push_token", "xxxxxxxxxx");
        apiHelper.deregisterPush(paramMap);
        */

        /*
        // 푸시 보내기
        paramMap = new HashMap<String, String>();
        paramMap.put("uuids", "[\"1\",\"2\", \"3\"]");
        apiHelper.sendPush(paramMap);
        */
    }
}
