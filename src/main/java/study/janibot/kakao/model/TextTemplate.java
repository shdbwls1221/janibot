package study.janibot.kakao.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TextTemplate {
    private final String object_type = "text";
    private String text;    // required. maxLength:200
    private Link link;      // required. 링크 정보
    private String button_title;
    private Button[] buttons;
}
