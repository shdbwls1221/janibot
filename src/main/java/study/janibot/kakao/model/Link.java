package study.janibot.kakao.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Link {
    private String web_url;
    private String mobile_web_url;
    private String android_execution_params;
    private String ios_execution_params;
}
