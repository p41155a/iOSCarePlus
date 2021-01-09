# iOSCarePlus

## 깃모지 정리

| 아이콘 | 코드 | 설명 |
|:---|:---:|:---:|
|✨|:sparkles:| 새 기능 |
|♻️|:recycle:| 코드 리팩토링 |
|🔥|:fire:| 코드/파일 삭제 |
|🐛|:bug:| 버그 수정 |
|🔖|:bookmark:| 릴리즈/버전 태그 |
|🛠||setting|
|❗️||경고 문구 제거|
|💡||Readme|



---



## 🍏 .gitignore

* `.gitignore` 파일을 추가하기 전에 commit을 했다면?

```
git rm -r --cached [파일명]
```



### references

* https://github.com/github/gitignore : github 공식 레포

* https://gitignore.io : 간단하게 gitignore 파일을 만들어주는 사이트



## 🍏 SwiftLint

### SwiftLint 적용하기

* XCode File Navigator에서 `프로젝트 폴더` 클릭
* 기본 App `Target` 클릭
* `Build Phases`로 이동
* `+` 버튼 클릭

* `New Run Script Phases` 클릭하여 아래의 코드 추가

```
if which swiftlint >/dev/null; then
    swiftlint
else
    echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
```

* 방금 추가한 스텝의 위치를 `Compile Sources` 위로 이동한다.



### references

* https://github.com/realm/SwiftLint



## 🍏 의존성 관리 도구 Dependency Manager



라이브러리의 다운로드와 버전 및 의존성을 쉽게 관리해주는 도구

* *SPM (Swift Package Manager)*

​    * *Apple 공식!* 앞으로 대부분 상용될 것이다.

​    \* 비교적 최근에 출시되어서 아직 지원하지 않는 라이브러리들이 있다.

* *CocoaPods*

​    \* 대중적이고 사용하기 편리하다. 대부분의 라이브러리를 지원하고 있다.

​    \* Workspace 환경에서 작업해야하며, 빌드 시간이 오래걸린다.

* *Carthage*

