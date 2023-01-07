# 은행 창구 매니저 💸

## 목차 🪧
- [소개 📑](#소개-)
- [팀원 🤼‍♂️](#팀원-%EF%B8%8F)
- [프로젝트 구조 🏗](#프로젝트-구조-)
- [구현 내용 🧑‍💻](https://github.com/Judy-999/ios-bank-manager/wiki/구현내용)
- [실행 화면 📱](#실행-화면-)
- [핵심 경험 💡](#핵심-경험-)
- [트러블 슈팅 [STEP 2] 🧐](https://github.com/Judy-999/ios-bank-manager/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85-%5BSTEP-2%5D-%F0%9F%A7%90)
- [트러블 슈팅 [STEP 3] 🧐](https://github.com/Judy-999/ios-bank-manager/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85-%5BSTEP-3%5D-%F0%9F%A7%90)
- [트러블 슈팅 [STEP 4] 🧐](트러블-슈팅-step-4-)
- [참고 링크 🔗](#참고-링크-)
<br>

## 소개 📑
> 은행 창구에서 은행원이 업무를 처리하는 콘솔 앱과 UI 앱을 만드는 프로젝트
 
<br>

## 팀원 🤼‍♂️
> 안녕하세요 ! 은행 창구 매니저 프로젝트를 함께하는 **`Junf`**  🤷🏻‍♀️ 🙋🏻‍♂️ 입니다 ! 🍊
> 
|bonf| Judy|
|:-------:|:--------:|
| <img src="https://i.imgur.com/yGJljLR.jpg" width="350" height="350"/> |  <img src="https://i.imgur.com/SUeFi0b.jpg" height="350"/>    |
|@apwierk2451|@Judy-999|

- 리뷰어: 콘🌽(@protocorn93) 
<br>

## 프로젝트 구조 🏗
**UML**

 <img src="https://i.imgur.com/fuxHa4B.png" width="700" height="550"/>
<br>

## 구현 내용 🧑‍💻
[ 👉 STEP 별 구현내용 보러가기](https://github.com/Judy-999/ios-bank-manager/wiki/구현내용)
<br>

## 실행 화면 📱
### Step 2 콘솔 앱 실행화면
![console](https://user-images.githubusercontent.com/95114036/176831382-006e7026-518e-4d28-8ff2-7d023749c880.gif)

### Step 3 콘솔 앱 실행화면

![console](https://i.imgur.com/XuprLH6.gif)

### Step 4 UI 앱 실행화면
![](https://i.imgur.com/HaIvW70.gif)

<br>

## 핵심 경험 💡
### [STEP 2]
- [x]  Linked-list 자료구조
- [x]  Queue 자료구조
- [x]  Generics 
- [x]  타입 추상화 및 일반화

### [STEP 3]
- [x]  동기(Synchronous)와 비동기(Asynchronous)
- [x]  동시성 프로그래밍
- [x]  GCD, Operation 등의 이해
- [x]  스레드(Thread) 
- [x]  GCD를 활용한 동시성 프로그래밍

### [STEP 4]
- [x] Code Based UI

<br>
<br>

## 트러블 슈팅 [STEP 2] 🧐

[👉 STEP 2 트러블 슈팅 보러가기](https://github.com/Judy-999/ios-bank-manager/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85-%5BSTEP-2%5D-%F0%9F%A7%90)

<br>

## 트러블 슈팅 [STEP 3] 🧐
[👉 STEP 3 트러블 슈팅 보러가기](https://github.com/Judy-999/ios-bank-manager/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85-%5BSTEP-3%5D-%F0%9F%A7%90)
<br>

## 트러블 슈팅 [STEP 4] 🧐
### 1. 고객 큐의 정보를 띄우고 업무를 시키는 일
- **문제** : 고객 정보를 스택뷰에 넣고 나서 업무를 실행하면 업무가 안되고, 업무를 실행하면 고객 정보가 없는 문제 발생<br><br>
- **이유** : 고객 정보를 레이블에 넣기 위해 큐에서 고객을 ❗️`dequeue`❗️ 해서 사용함
- 큐에서 모든 고객이 `dequeue`로 이미 없어져서 업무를 시킬 고객이 남지 않았음<br><br>
- **해결** : **LinkedList**와 **Queue**에 전체 노드의 값을 배열로 반환하는 `returnList` 메서드를 추가
-  `dequeue`하지 않고 고객 정보를 가져옴
<br>

### 2. 스택뷰에 있는 고객 정보 레이블을 다른 스택뷰로 옮기기 
- **문제** : 고객의 업무가 업무중으로 넘어가면 해당 고객의 레이블을 어떻게 `업무중` 스택뷰로 이동시킬지 고민<br><br>
- **해결** :  `Notification`을 사용해 업무 처리가 시작되면 알려줌
- 알림을 받으면 `대기중` 스택뷰의 하위 뷰 중에서 `filter`로 고객 정보를 비교해서 해당 고객의 레이블을 골라냄
```swift
let customerLabel = stackView.arrangedSubviews.filter {
     let label = $0 as? UILabel
     return label?.text == text
}
```
- 해당 레이블을 `대기중` 스택뷰에서 제거하고 `업무중` 스택뷰에 추가해줌
<br>

### 3. 모든 업무를 완료하면 타이머 종료하기
- **문제** : 모든 고객의 업무가 끝나면 타이머가 멈춰야하는데 업무나 끝나는 시점을 알기 어려움<br><br>
- **해결** : `대기중` 스택뷰와 `업무중` 스택뷰가 모두 비워져있으면(`isEmpty`이면) 업무가 끝났다고 생각
```swift
if self.mainView.waitingStackView.arrangedSubviews.isEmpty && self.mainView.processingStackView.arrangedSubviews.isEmpty {
                self.timer.invalidate()
}
```
- 업무가 완료되어 업무중` 스택뷰`에서 사라지게 할 때 모든 스택뷰가 비어있는지 확인하여 비어있으면 타이머를 정지시킴
<br>

### 4. 10명 추가한 고객의 비동기 처리
- **문제** : 고객 10명을 추가하면 추가된 10명의 고객은 새롭게 비동기로 처리됨
- 은행원이 3명 추가되어 업무를 처리하는 것과 같아 요구사항에 맞지 않음<br><br>
- **이유** : 업무를 시키는 `startBanking` 메서드가 호출될 때마다 **Bank** 인스턴스가 새로 생성되고 있었음
- 10명의 추가된 고객은 다른 새로운 은행에서 업무를 처리하는 것과 같았음<br><br>
- **해결** : **BankManager**에 **Bank**를 프로퍼티로 갖게 해서 하나의 은행만 가지도록 함
<br>

<br>

## 참고 링크 🔗
[Generics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)<br>
[Equatable](https://developer.apple.com/documentation/swift/equatable)<br>
[Queue](https://github.com/raywenderlich/swift-algorithm-club)<br>
[Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html)<br>
[야곰닷넷 - 동시성 프로그래밍](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/)
