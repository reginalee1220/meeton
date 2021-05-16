-- 영상
CREATE TABLE `video` (
                         `videonum`    INT          NOT NULL COMMENT '영상번호', -- 영상번호
                         `channelnum`  INT          NOT NULL COMMENT '채널번호', -- 채널번호
                         `userid`      VARCHAR(20)  NOT NULL COMMENT '회원id', -- 회원id
                         `title`       VARCHAR(100) NOT NULL COMMENT '제목', -- 제목
                         `description` VARCHAR(500) NULL     COMMENT '설명', -- 설명
                         `thumbnail`   VARCHAR(500) NULL     COMMENT '미리보기', -- 미리보기
                         `visibility`  VARCHAR(2)   NOT NULL DEFAULT 1 COMMENT '공개여부', -- 공개여부
                         `register`    TIMESTAMP    NOT NULL COMMENT '영상올린날짜', -- 영상올린날짜
                         `views`       INT          NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
                         `comments`    INT          NOT NULL DEFAULT 0 COMMENT '댓글수', -- 댓글수
                         `likes`       INT          NOT NULL DEFAULT 0 COMMENT '좋아요수', -- 좋아요수
                         `report`      INT          NOT NULL DEFAULT 0 COMMENT '신고수', -- 신고수
                         `videofile`   VARCHAR(500) NOT NULL COMMENT '영상파일', -- 영상파일
                         `videotime`   TIME         NOT NULL COMMENT '영상시간' -- 영상시간
)
    COMMENT '영상';

-- 영상
ALTER TABLE `video`
    ADD CONSTRAINT `PK_video` -- video
        PRIMARY KEY (
                     `videonum` -- 영상번호
            );

-- 채널
CREATE TABLE `channel` (
                           `channelnum`  INT         NOT NULL COMMENT '채널번호', -- 채널번호
                           `userid`      VARCHAR(20) NOT NULL COMMENT '회원id', -- 회원id
                           `aka`         VARCHAR(20) NOT NULL COMMENT '닉네임', -- 닉네임
                           `subscribers` INT         NOT NULL DEFAULT 0 COMMENT '구독자수' -- 구독자수
)
    COMMENT '채널';

-- 채널
ALTER TABLE `channel`
    ADD CONSTRAINT `PK_channel` -- 채널 기본키
        PRIMARY KEY (
                     `channelnum` -- 채널번호
            );

-- 댓글
CREATE TABLE `comment` (
                           `commentnum` INT          NOT NULL COMMENT '댓글번호', -- 댓글번호
                           `videonum`   INT          NOT NULL COMMENT '영상번호', -- 영상번호
                           `userid`     VARCHAR(20)  NOT NULL COMMENT '회원id', -- 회원id
                           `content`    VARCHAR(500) NOT NULL COMMENT '내용', -- 내용
                           `likes`      INT          NOT NULL DEFAULT 0 COMMENT '좋아요수', -- 좋아요수
                           `register`   TIMESTAMP    NOT NULL COMMENT '댓글쓴날짜', -- 댓글쓴날짜
                           `pinned`     VARCHAR(2)   NOT NULL DEFAULT 0 COMMENT '고정여부', -- 고정여부
                           `ref`        INT          NULL     DEFAULT 0 COMMENT '부모댓글', -- 부모댓글
                           `lev`        INT          NULL     COMMENT '댓글깊이수준', -- 댓글깊이수준
                           `seq`        INT          NULL     COMMENT 'seq', -- seq
                           `report`     INT          NOT NULL DEFAULT 0 COMMENT '신고수' -- 신고수
)
    COMMENT '댓글';

-- 댓글
ALTER TABLE `comment`
    ADD CONSTRAINT `PK_comment` -- 댓글 기본키
        PRIMARY KEY (
                     `commentnum` -- 댓글번호
            );

-- 회원
CREATE TABLE `user` (
                        `userid`      VARCHAR(20)  NOT NULL COMMENT '회원id', -- 회원id
                        `passwd`      VARCHAR(50)  NOT NULL COMMENT '비밀번호', -- 비밀번호
                        `name`        VARCHAR(20)  NOT NULL COMMENT '이름', -- 이름
                        `phone`       VARCHAR(20)  NOT NULL COMMENT '핸드폰번호', -- 핸드폰번호
                        `email`       VARCHAR(50)  NOT NULL COMMENT '이메일', -- 이메일
                        `domain`      VARCHAR(20)  NOT NULL COMMENT '도메인', -- 도메인
                        `zip`         VARCHAR(5)   NOT NULL COMMENT '우편번호', -- 우편번호
                        `address1`    VARCHAR(100) NOT NULL COMMENT '주소1', -- 주소1
                        `address2`    VARCHAR(100) NOT NULL COMMENT '주소2', -- 주소2
                        `year`        VARCHAR(4)   NOT NULL COMMENT '년', -- 년
                        `month`       VARCHAR(2)   NOT NULL COMMENT '월', -- 월
                        `day`         VARCHAR(2)   NOT NULL COMMENT '일', -- 일
                        `profile`     VARCHAR(500) NULL     COMMENT '프로필', -- 프로필
                        `aka`         VARCHAR(20)  NULL     COMMENT '닉네임', -- 닉네임
                        `joindate`    TIMESTAMP    NOT NULL COMMENT '회원가입날짜', -- 회원가입날짜
                        `state`       VARCHAR(2)   NOT NULL DEFAULT 1 COMMENT '회원상태', -- 회원상태
                        `userdeldate` TIMESTAMP    NULL     COMMENT '탈퇴날짜' -- 탈퇴날짜
)
    COMMENT '회원';

-- 회원
ALTER TABLE `user`
    ADD CONSTRAINT `PK_user` -- 회원 기본키
        PRIMARY KEY (
                     `userid` -- 회원id
            );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX `aka`
	ON `user` ( -- 회원
		`aka` ASC -- 닉네임
	);

-- 구독
CREATE TABLE `subscriptions` (
                                 `userid`       VARCHAR(20) NOT NULL COMMENT '회원id', -- 회원id
                                 `channelnum`   INT         NOT NULL COMMENT '채널번호', -- 채널번호
                                 `purchasednum` INT         NOT NULL COMMENT '결제번호', -- 결제번호
                                 `startdate`    TIMESTAMP   NOT NULL COMMENT '구독시작날짜' -- 구독시작날짜
)
    COMMENT '구독';

-- 즐겨찾기
CREATE TABLE `bookmark` (
                            `userid`     VARCHAR(20) NOT NULL COMMENT '회원id', -- 회원id
                            `channelnum` INT         NOT NULL COMMENT '채널번호' -- 채널번호
)
    COMMENT '즐겨찾기';

-- 좋아요한영상
CREATE TABLE `likedvideo` (
                              `userid`   VARCHAR(20) NOT NULL COMMENT '회원id', -- 회원id
                              `videonum` INT         NOT NULL COMMENT '영상번호' -- 영상번호
)
    COMMENT '좋아요한영상';

-- 나중에볼영상
CREATE TABLE `watchlater` (
                              `userid`   VARCHAR(20) NOT NULL COMMENT '회원id', -- 회원id
                              `videonum` INT         NOT NULL COMMENT '영상번호' -- 영상번호
)
    COMMENT '나중에볼영상';

-- 최근에본영상
CREATE TABLE `history` (
                           `userid`   VARCHAR(20) NOT NULL COMMENT '회원id', -- 회원id
                           `videonum` INT         NOT NULL COMMENT '영상번호' -- 영상번호
)
    COMMENT '최근에본영상';

-- 결제
CREATE TABLE `purchased` (
                             `purchasednum` INT         NOT NULL COMMENT '결제번호', -- 결제번호
                             `paydate`      TIMESTAMP   NOT NULL COMMENT '결제날짜', -- 결제날짜
                             `payment`      INT         NOT NULL COMMENT '결제금액', -- 결제금액
                             `method`       VARCHAR(20) NOT NULL COMMENT '결제수단' -- 결제수단
)
    COMMENT '결제';

-- 결제
ALTER TABLE `purchased`
    ADD CONSTRAINT `PK_purchased` -- 결제 기본키
        PRIMARY KEY (
                     `purchasednum` -- 결제번호
            );

-- 알람채널
CREATE TABLE `channelalarm` (
                                `userid`     VARCHAR(20) NOT NULL COMMENT '회원id', -- 회원id
                                `channelnum` INT         NOT NULL COMMENT '채널번호' -- 채널번호
)
    COMMENT '알람채널';

-- 댓글알람
CREATE TABLE `commentalarm` (
                                `alarmnum`        INT         NOT NULL COMMENT '댓글알람번호', -- 댓글알람번호
                                `commentnum`      INT         NOT NULL COMMENT '댓글번호', -- 댓글번호
                                `actuser`         VARCHAR(20) NOT NULL COMMENT '행위자', -- 행위자
                                `commentregister` TIMESTAMP   NULL     COMMENT '대댓쓴날짜', -- 대댓쓴날짜
                                `likeregister`    TIMESTAMP   NULL     COMMENT '좋아요한날짜', -- 좋아요한날짜
                                `state`           VARCHAR(2)  NOT NULL DEFAULT 0 COMMENT '상태' -- 상태
)
    COMMENT '댓글알람';

-- 댓글알람
ALTER TABLE `commentalarm`
    ADD CONSTRAINT `PK_commentalarm` -- 댓글알람 기본키
        PRIMARY KEY (
                     `alarmnum` -- 댓글알람번호
            );

-- DM
CREATE TABLE `dmchat` (
                          `dmnum`     INT          NOT NULL COMMENT 'DM번호', -- DM번호
                          `dmfile`    VARCHAR(500) NOT NULL COMMENT '대화파일', -- 대화파일
                          `sender`    VARCHAR(20)  NOT NULL COMMENT '보내는사람', -- 보내는사람
                          `recipient` VARCHAR(20)  NOT NULL COMMENT '받는사람' -- 받는사람
)
    COMMENT 'DM';

-- DM
ALTER TABLE `dmchat`
    ADD CONSTRAINT `PK_dmchat` -- DM 기본키
        PRIMARY KEY (
                     `dmnum` -- DM번호
            );

-- 영상
ALTER TABLE `video`
    ADD CONSTRAINT `FK_user_TO_video` -- 회원 -> 영상
        FOREIGN KEY (
                     `userid` -- 회원id
            )
            REFERENCES `user` ( -- 회원
                               `userid` -- 회원id
                );

-- 영상
ALTER TABLE `video`
    ADD CONSTRAINT `FK_channel_TO_video` -- 채널 -> 영상
        FOREIGN KEY (
                     `channelnum` -- 채널번호
            )
            REFERENCES `channel` ( -- 채널
                                  `channelnum` -- 채널번호
                );

-- 채널
ALTER TABLE `channel`
    ADD CONSTRAINT `FK_user_TO_channel` -- 회원 -> 채널
        FOREIGN KEY (
                     `userid` -- 회원id
            )
            REFERENCES `user` ( -- 회원
                               `userid` -- 회원id
                );

-- 채널
ALTER TABLE `channel`
    ADD CONSTRAINT `FK_user_TO_channel2` -- 회원 -> 채널2
        FOREIGN KEY (
                     `aka` -- 닉네임
            )
            REFERENCES `user` ( -- 회원
                               `aka` -- 닉네임
                );

-- 댓글
ALTER TABLE `comment`
    ADD CONSTRAINT `FK_user_TO_comment` -- 회원 -> 댓글
        FOREIGN KEY (
                     `userid` -- 회원id
            )
            REFERENCES `user` ( -- 회원
                               `userid` -- 회원id
                );

-- 댓글
ALTER TABLE `comment`
    ADD CONSTRAINT `FK_video_TO_comment` -- 영상 -> 댓글
        FOREIGN KEY (
                     `videonum` -- 영상번호
            )
            REFERENCES `video` ( -- 영상
                                `videonum` -- 영상번호
                );

-- 구독
ALTER TABLE `subscriptions`
    ADD CONSTRAINT `FK_user_TO_subscriptions` -- 회원 -> 구독
        FOREIGN KEY (
                     `userid` -- 회원id
            )
            REFERENCES `user` ( -- 회원
                               `userid` -- 회원id
                );

-- 구독
ALTER TABLE `subscriptions`
    ADD CONSTRAINT `FK_channel_TO_subscriptions` -- 채널 -> 구독
        FOREIGN KEY (
                     `channelnum` -- 채널번호
            )
            REFERENCES `channel` ( -- 채널
                                  `channelnum` -- 채널번호
                );

-- 구독
ALTER TABLE `subscriptions`
    ADD CONSTRAINT `FK_purchased_TO_subscriptions` -- 결제 -> 구독
        FOREIGN KEY (
                     `purchasednum` -- 결제번호
            )
            REFERENCES `purchased` ( -- 결제
                                    `purchasednum` -- 결제번호
                );

-- 즐겨찾기
ALTER TABLE `bookmark`
    ADD CONSTRAINT `FK_user_TO_bookmark` -- 회원 -> 즐겨찾기
        FOREIGN KEY (
                     `userid` -- 회원id
            )
            REFERENCES `user` ( -- 회원
                               `userid` -- 회원id
                );

-- 즐겨찾기
ALTER TABLE `bookmark`
    ADD CONSTRAINT `FK_channel_TO_bookmark` -- 채널 -> 즐겨찾기
        FOREIGN KEY (
                     `channelnum` -- 채널번호
            )
            REFERENCES `channel` ( -- 채널
                                  `channelnum` -- 채널번호
                );

-- 좋아요한영상
ALTER TABLE `likedvideo`
    ADD CONSTRAINT `FK_user_TO_likedvideo` -- 회원 -> 좋아요한영상
        FOREIGN KEY (
                     `userid` -- 회원id
            )
            REFERENCES `user` ( -- 회원
                               `userid` -- 회원id
                );

-- 좋아요한영상
ALTER TABLE `likedvideo`
    ADD CONSTRAINT `FK_video_TO_likedvideo` -- 영상 -> 좋아요한영상
        FOREIGN KEY (
                     `videonum` -- 영상번호
            )
            REFERENCES `video` ( -- 영상
                                `videonum` -- 영상번호
                );

-- 나중에볼영상
ALTER TABLE `watchlater`
    ADD CONSTRAINT `FK_user_TO_watchlater` -- 회원 -> 나중에볼영상
        FOREIGN KEY (
                     `userid` -- 회원id
            )
            REFERENCES `user` ( -- 회원
                               `userid` -- 회원id
                );

-- 나중에볼영상
ALTER TABLE `watchlater`
    ADD CONSTRAINT `FK_video_TO_watchlater` -- 영상 -> 나중에볼영상
        FOREIGN KEY (
                     `videonum` -- 영상번호
            )
            REFERENCES `video` ( -- 영상
                                `videonum` -- 영상번호
                );

-- 최근에본영상
ALTER TABLE `history`
    ADD CONSTRAINT `FK_user_TO_history` -- 회원 -> 최근에본영상
        FOREIGN KEY (
                     `userid` -- 회원id
            )
            REFERENCES `user` ( -- 회원
                               `userid` -- 회원id
                );

-- 최근에본영상
ALTER TABLE `history`
    ADD CONSTRAINT `FK_video_TO_history` -- 영상 -> 최근에본영상
        FOREIGN KEY (
                     `videonum` -- 영상번호
            )
            REFERENCES `video` ( -- 영상
                                `videonum` -- 영상번호
                );

-- 알람채널
ALTER TABLE `channelalarm`
    ADD CONSTRAINT `FK_user_TO_channelalarm` -- 회원 -> 알람채널
        FOREIGN KEY (
                     `userid` -- 회원id
            )
            REFERENCES `user` ( -- 회원
                               `userid` -- 회원id
                );

-- 알람채널
ALTER TABLE `channelalarm`
    ADD CONSTRAINT `FK_channel_TO_channelalarm` -- 채널 -> 알람채널
        FOREIGN KEY (
                     `channelnum` -- 채널번호
            )
            REFERENCES `channel` ( -- 채널
                                  `channelnum` -- 채널번호
                );

-- 댓글알람
ALTER TABLE `commentalarm`
    ADD CONSTRAINT `FK_comment_TO_commentalarm` -- 댓글 -> 댓글알람
        FOREIGN KEY (
                     `commentnum` -- 댓글번호
            )
            REFERENCES `comment` ( -- 댓글
                                  `commentnum` -- 댓글번호
                );

-- 댓글알람
ALTER TABLE `commentalarm`
    ADD CONSTRAINT `FK_user_TO_commentalarm` -- 회원 -> 댓글알람
        FOREIGN KEY (
                     `actuser` -- 행위자
            )
            REFERENCES `user` ( -- 회원
                               `userid` -- 회원id
                );

-- DM
ALTER TABLE `dmchat`
    ADD CONSTRAINT `FK_user_TO_dmchat` -- 회원 -> DM
        FOREIGN KEY (
                     `sender` -- 보내는사람
            )
            REFERENCES `user` ( -- 회원
                               `userid` -- 회원id
                );

-- DM
ALTER TABLE `dmchat`
    ADD CONSTRAINT `FK_user_TO_dmchat2` -- 회원 -> DM2
        FOREIGN KEY (
                     `recipient` -- 받는사람
            )
            REFERENCES `user` ( -- 회원
                               `userid` -- 회원id
                );