<div align="center">
  <h3><a href="#readme-top-en">Click here for English README</a></h3>
</div>
<a id="readme-top"></a>

# Flutter Custom Avatar

<br />
<div align="center">
  <h3 align="center">Flutter 아바타 커스터마이징 예제 프로젝트</h3>

  <p align="center">
    Flutter로 픽셀 아트 아바타를 커스터마이징하고 애니메이션을 적용하는 예제입니다.
    <br />
  </p>
</div>

## 주요 기능

* **아바타 커스터마이징**: 아바타의 각 파츠(몸, 머리, 눈 등)별로 원하는 색상을 선택할 수 있습니다.
* **프레임 애니메이션**: 몸통 부분이 두 이미지 사이를 주기적으로 전환하며 자연스러운 '숨쉬는' 애니메이션 효과를 연출합니다.
* **성능 최적화**: `Timer.periodic`을 사용한 직접적인 이미지 교체 방식으로, `ColorFiltered` 위젯과 애니메이션 위젯의 충돌 문제를 해결하여 깜빡임 없이 부드러운 전환을 구현했습니다.

<p align="right">(<a href="#readme-top">맨 위로 돌아가기</a>)</p>

## 프로젝트 구조

```
flutter_custom_avatar/
├── android/
├── ios/
├── lib/
│   └── main.dart             # 메인 애플리케이션 코드
├── assets/
│   └── images/
│       ├── body_1.png
│       ├── body_2.png
│       ├── top.png
│       ├── bottom.png
│       ├── mouth.png
│       ├── eyes.png
│       ├── eyes_background.png
│       └── hair.png
├── pubspec.yaml              # 의존성 및 에셋(assets) 설정 파일
└── README.md
```

<p align="right">(<a href="#readme-top">맨 위로 돌아가기</a>)</p>

## 코드 설명

이 프로젝트는 `StatefulWidget`인 `CustomAvatar` 클래스를 중심으로 구성됩니다. 아바타의 각 파츠는 `Stack` 위젯 위에 이미지로 겹쳐 쌓아 표현되며, 사용자가 선택한 색상은 `ColorFiltered` 위젯을 통해 이미지에 적용됩니다.

* **이미지 확대**: 64x64 픽셀의 작은 이미지를 `Transform.scale`을 사용하여 4배 확대하여 픽셀 아트의 느낌을 살렸습니다.
* **색상 관리**: 각 파츠의 색상 팔레트는 정적 리스트로 정의되며, 사용자의 선택에 따라 상태 변수가 업데이트됩니다.
* **애니메이션**: `Timer.periodic`을 사용하여 800ms 간격으로 몸통 이미지를 변경합니다. 이 방식은 `ColorFiltered`와 충돌하는 투명도 애니메이션 문제를 해결합니다.

<p align="right">(<a href="#readme-top">맨 위로 돌아가기</a>)</p>

## 애셋 (Assets)

이 프로젝트에 사용된 모든 픽셀 아트 이미지(아바타 파츠 등)는 이 프로젝트의 기여자(alicia6-6)가 직접 제작했습니다.

<p align="right">(<a href="#readme-top">맨 위로 돌아가기</a>)</p>

## 시작하기

1.  프로젝트를 클론하거나 코드를 복사합니다.
2.  `assets/images` 폴더에 필요한 이미지 파일들을 추가합니다.
3.  `pubspec.yaml` 파일에 `assets` 섹션을 다음과 같이 추가합니다.

    ```yaml
    flutter:
      uses-material-design: true
      assets:
        - assets/images/
    ```

4.  터미널에서 `flutter pub get` 명령어를 실행합니다.
5.  `lib/main.dart` 파일을 열고 프로젝트를 실행합니다.

<p align="right">(<a href="#readme-top">맨 위로 돌아가기</a>)</p>

## 기여자

[<a href="https://github.com/alicia6-6/flutter_custom_avatar/graphs/contributors"><img src="https://contrib.rocks/image?repo=alicia6-6/flutter_custom_avatar" alt="기여자 이미지" /></a>](https://github.com/alicia6-6/flutter_custom_avatar/graphs/contributors)

<p align="right">(<a href="#readme-top">맨 위로 돌아가기</a>)</p>

## 라이선스

이 프로젝트는 MIT 라이선스를 따릅니다. 자세한 내용은 `LICENSE` 파일을 참조하세요.

<p align="right">(<a href="#readme-top">맨 위로 돌아가기</a>)</p>

<a id="readme-top-en"></a>

# Flutter Custom Avatar

<br />
<div align="center">
  <h3 align="center">Flutter Avatar Customization Example Project</h3>

  <p align="center">
    A Flutter example for creating a customizable pixel art avatar with a simple animation.
    <br />
  </p>
</div>

## Features

* **Avatar Customization**: Users can select and apply different colors to each part of the avatar (body, hair, eyes, etc.).
* **Frame-by-Frame Animation**: The body animates by cycling between two images, creating a subtle 'breathing' effect.
* **Performance Optimization**: The project uses a direct image-swapping method with `Timer.periodic`, which resolves flickering issues caused by opacity animations conflicting with the `ColorFiltered` widget.

<p align="right">(<a href="#readme-top-en">back to top</a>)</p>

## Project Structure

```
flutter_custom_avatar/
├── android/
├── ios/
├── lib/
│   └── main.dart             # Main application code
├── assets/
│   └── images/
│       ├── body_1.png
│       ├── body_2.png
│       ├── top.png
│       ├── bottom.png
│       ├── mouth.png
│       ├── eyes.png
│       ├── eyes_background.png
│       └── hair.png
├── pubspec.yaml              # Dependencies and assets configuration
└── README.md
```

<p align="right">(<a href="#readme-top-en">back to top</a>)</p>

## Code Explanation

This project is centered around the `CustomAvatar` class, which is a `StatefulWidget`. The avatar's parts are rendered by stacking images on a `Stack` widget, and user-selected colors are applied to each image using a `ColorFiltered` widget.

* **Image Scaling**: The original 64x64 pixel images are enlarged by a factor of 4 using `Transform.scale` to maintain the pixel art aesthetic.
* **Color Management**: Color palettes for each part are defined as static lists, and a state variable is updated based on user selection.
* **Animation**: A `Timer.periodic` is used to change the body image every 800ms. This approach resolves the flickering issues caused by opacity animations conflicting with `ColorFiltered`.

<p align="right">(<a href="#readme-top-en">back to top</a>)</p>

## Assets

All pixel art images (avatar parts, etc.) used in this project were created by the project contributor (alicia6-6).

<p align="right">(<a href="#readme-top-en">back to top</a>)</p>

## Getting Started

1.  Clone the project or copy the code.
2.  Add the necessary image files to the `assets/images` folder.
3.  Add the `assets` section to your `pubspec.yaml` file as follows:

    ```yaml
    flutter:
      uses-material-design: true
      assets:
        - assets/images/
    ```

4.  Run `flutter pub get` in your terminal.
5.  Open `lib/main.dart` and run the project.

<p align="right">(<a href="#readme-top-en">back to top</a>)</p>

## Contributors

[<a href="https://github.com/alicia6-6/flutter_custom_avatar/graphs/contributors"><img src="https://contrib.rocks/image?repo=alicia6-6/flutter_custom_avatar" alt="Contributors image" /></a>](https://github.com/alicia6-6/flutter_custom_avatar/graphs/contributors)

<p align="right">(<a href="#readme-top-en">back to top</a>)</p>

## License

This project is distributed under the MIT License. See the `LICENSE` file for more information.

<p align="right">(<a href="#readme-top-en">back to top</a>)</p>