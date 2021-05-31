<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>meeton</title>
  <!--Boxicons CDN Link-->
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="./css/admin/adminChannelContent.css">
  <link rel="stylesheet" href="./css/videoupload.css">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="./js/adminChannel.js"></script>
</head>
<body>
<div class="ca-container">
  <div class="ca-sidebar">
    <div class="ca-side-info">
      <div class="ca-side-profile"><img src="" /></div>
      <span>채널이름</span>
    </div>
    <ul class="ca-side-menu">
      <li>
        <div class="ca-side-action"></div>
        <a href="#">
          <img class="image1" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAiElEQVRIS+2VMQ7AIAwDyYvavi+M8D/6olRUYmAAOVGDGNoVg3tWDBScP3I+P6w1SCkVIjoGVIWZr7qG6qq2I8g5yywyZn71qO43GKbZotw3otkUicgdYzwbnmmKNOVca4Cim4uGopuL5m6AopsJ0I2obt+i7UvwRQ+mVwU6phrd2jdZ82eo9gHX8pQZEpz/EAAAAABJRU5ErkJggg=="/>
          <img class="image2" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAg0lEQVRIS+2VUQ6AIAxD1xOp978EnqgGEz78GCmLQz7kl8J4zTpgyQvJ99vcAiSLmW0OVQFw1D1VV7UPApLsWQbg1qu6v4DrZrNyaYt63XYC2BteqItGwjm9gIQeDpqKHg5aegEVPUygHlR1SwdNmrqfELyRA39UqG06opv7J4+8TNVerbGIGS/g3QMAAAAASUVORK5CYII="/>
          <span>대시보드</span>
        </a>
      </li>
      <li>
        <div class="ca-side-action"></div>
        <a href="#">
          <img class="image1" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArUlEQVRIS2NkoDFgpLH5DPSzoLm52YGJiWk+AwODAoW+evDv37/E2traAyBz4D5obW19wMDAIE+h4TDtD6qrqxXRLfgPEqiursYZbK2trWA1xACYOcg+GFwWYPMpsg8p9gHNLSAUDxT7gOYW0DyIaG4BzYNo1AKsITDoy6IPDAwM/IQij0j5h9XV1eB6BV6aQiucBVSoEx7++/cvAaPCIdJlJCujX51MstOI1AAACCScGZsgnHsAAAAASUVORK5CYII="/>
          <img class="image2" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAo0lEQVRIS+2V0Q3CMAxE303ACMAmjAKTlVEYpd2ADQ4lUqsIipoquOoH/kxsn+8s+URwKLg/2wHYvgAdcGpk1QM3SY/UZ2JgO30cG5uP5b2k8zuA84P0VTbbOacmxj4lg30BzDEtGTYzCAdY2kMzg3CAcInCAcIl+gPMKrD7W/QEDkvLq/wfJGVfKa9pMpz7DzxhAK4fhlM52eq07Tx59WiVBS8IOZYZfURMMwAAAABJRU5ErkJggg=="/>
          <span>콘텐츠</span>
        </a>
      </li>
      <li>
        <div class="ca-side-action"></div>
        <a href="#">
          <img class="image1" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAt0lEQVRIS2NkoDFgpLH5DPS1oLm52YGJiWk+AwODApk+e/Dv37/E2traAzD9KD5obW19wMDAIE+m4TBtD6qrqxVxWfAfJFFdXU1W0LW2tmLoR/fBwFqAzYXIwUmxD4afBeg+onoQUWwBIQMIyYMSAN5kSsgAQvKjFjBQHESkFnoUJ1NCFhJjwQcGBgZ+QgYRkH9YXV0Nr09Qkim0wllAQZ3w8N+/fwk4KxwKXY5VO1kVCykOobkFADEA5BmsqRxXAAAAAElFTkSuQmCC"/>
          <img class="image2" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAq0lEQVRIS+2V0Q2DQAxD7QkYgXaTjgKT0VE6CmzQDYyuEggOaMqFa6UKfkP84ig6E5k/ZtbHdwGSbgAaAJdEZy2AmuRj6J85kBR+KBPFh7aW5HULoFAgmbQ6SYv+2MFvAWsTTtfpdvB/gNjR4StyAywBq/46+XdXYAlY9RMA94r2PnruM7WAnwCeAApLyKh3JMc8ic80BM7dkQkdgGozcJyTr7YnBcueQbIDeoin3hlZEEibAAAAAElFTkSuQmCC"/>
          <span>채널분석</span>
        </a>
      </li>
      <li>
        <div class="ca-side-action"></div>
        <a href="#">
          <img class="image1" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABWUlEQVRIS+3WzW2DMBQH8GeEOXeDZIN0hGSTMkFzt5BcIcS1GzTdoBs0I5AJqm6QMzamesiWiMuHC46IqnBBSOb99H/G2AQWushCLtwGzDl/iKJog10oy/LEOT9fqyMXidM03QZB8ImYUmqXJMnxDvvqwL3V/+fjwiVKKX1mjL20v4+rzrFGcXk+AsCBMRYbfBas1/1GCPFu/2wsFOq6Pkkpt2bcZDjLsicAeNMJCiHEzhQdQ/GdSbCFmu41OD5QSk17fyWd3OoO9BsAVia5vuOc9qJ/TtyBxkKIjzAMj4SQZnMxlz2n9h/PudVdKGPsgAVxTtv4GOqceAg1STT+is9Syv3YluqU2IJjk3TOhuEEI6Bx8IE6t3pOsr53nRP7xnthANgTQgpfoH2GG4J9mU0d+wx3Aed5vlZKfXkVdbFBGMcgLqVc+8arqiraa/s2DvS+Uw7VWyzxDw0tUS4xdXO1AAAAAElFTkSuQmCC"/>
          <img class="image2" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAA2UlEQVRIS+2V/Q3CIBTE7zZwEx1BN3ATV7ATOYIdwW7iBs+ceZgWobQpNZrIXxDC7+59AMTKgyvz8VkBMzNFRLKa8AD0F0g1zG+lyMw2AE4kmxBNtQgcfgWwA9CQPD87sp+3Uhf1IDp2IHnXJIJ3APZhb7JABBH3JhE3GJwP4JMjSDjU2a2LaK60vMEnCaTCd9eti2iZhBcFxnLrexLReOU8vgujNTCzI4DLmMPSa1wssou0oStKwFkRzIV9z1Ox1Hn/P4lroMuj/l40sgKLqJnD1b7GnLnVBR6TwIoZpGcjUAAAAABJRU5ErkJggg=="/>
          <span>구독현황</span>
        </a>
      </li>
    </ul>
    <div class="ca-back">
      <a href="#">
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABZElEQVRIS+2W0U3DMBCG7yznmW5CN4AVmADYoK/xJVKQcnNQNmAD2g3SDcoGsEAOOYpRCKE9p4QIqX5Koos/23f/70OYaeBMXPhfYGZeIuKF9rQQ8TVN0303PmrHRVEskiR5AYClFtqJWxPRfXiPApdluUbE2xHQ5hdEvHHOPTfPMZMw8wYArkRkJyIr7b/GGH9KfjwQUTEaDABbIrrWgplZzuCDOW6ruCCiJp8hx5MetdcqAPii2IV8+m91XS+MMW9EVP16jpn5DgAe24mjCmloMariGtBqhYhq6Tjntn34QfCJrvTJIqJvdXMUbK3dIOKlNndDcdHgMEn/qGNdKs9z725fhirHrWz+vrjCUls5+dVXXTn561BE3ieRU4DPYiA/6LG5nSZ1rjO4d0lEuZmIBImNawRma318lY91NxF5yrLM+0Mzonqursb99ai1Vmvt/qT2VgvSxI3asWbiYzGzgT8Aukn5HxTmoAsAAAAASUVORK5CYII="/>
      </a>
    </div>
  </div><!--ca-sidebar end-->
  <div class="ca-main">
    <!--                    content                  -->
    <div class="ca-content">
      <div class="ca-main-title">
        <span>채널 콘텐츠</span>
      </div>
      <ul class="ca-content-content">
        <li class="ca-content-list">
          <img class="ca-content-filter-img" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAA5UlEQVRIS+2TQQ6CMBBFW0pYewO5gR5BjwUNcQxpOJZ6A70B3sA1AWpmh4iWwWJZdJZN57/Om5QzR8UdcZkH/828V+1WdZ7nOyGEtvWKNE0v/azBHSulrEERKKV84ywLjKptacacLMvOo1TbhH7KMv5jAFhFUbShPKaqqhsAPL71GMGoPQiCEwXctu1+SG83Y7lgVC2E2FImbprm+rNqCpBy16i6H1YURay1Xr/si/N7kiTlrGClFDDGDj3IUUqJ56OLPLEzMKqu6zrujhaGYTm76tEuDRfJqj14qgGveqo5cp8z1U+m6UsfvsKjaAAAAABJRU5ErkJggg=="/>
          <span>필터</span>
          <ul class="ca-content-filter-box">
            <li><input type="radio" /><label>제목</label></li>
            <li><input type="radio" /><label>공개여부</label></li>
            <li><input type="radio" /><label>날짜순</label></li>
            <li><input type="radio" /><label>조회수순</label></li>
            <li><input type="radio" /><label>댓글순</label></li>
            <li><input type="radio" /><label>좋아요순</label></li>
          </ul>
        </li>
        <li class="ca-content-list">
          <div>
            <input class="ca-content-filter-chk" type="checkbox"/>
            <span>동영상</span>
          </div>
          <div>
            <span>공개상태</span>
          </div>
          <div>
            <span>날짜</span>
          </div>
          <div>
            <span>조회수</span>
          </div>
          <div>
            <span>댓글</span>
          </div>
          <div>
            <span>좋아요</span>
          </div>
        </li>
        <li class="ca-content-list">
          <div class="ca-content-video">
            <input class="ca-content-filter-chk" type="checkbox"/>
            <img class="ca-content-video-img" src="image/videobackground2.png"/>
            <div class="ca-content-video-desc">
              <h5>영상제목</h5>
              <p>영상설명</p>
            </div>
          </div>
          <div>
            <span>공개</span>
          </div>
          <div>
            <span>2021.05.22</span>
          </div>
          <div>
            <span>24</span>
          </div>
          <div>
            <span>13</span>
          </div>
          <div>
            <span>2</span>
          </div>
        </li>
        <li class="ca-content-list">
          <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAwklEQVRIS+2UsQ3DIBBF7ySgzibxCM4ImSQ915wL9skG8QjOJulBIkJKgSJjfMiWG1Of/vv/A4ew88Gd9eEEVBs+tiLnXEwWiWjWCDNftNYPIhpKURYTLAF+4i8A6ABgICKegzQBcvEY4zuE0DPzZxOARDwBRQmk4iJAi7gYoJQaEfEKAJP3/lbqPb8LcUVSiAiQnKWqJBAxQAppAvxDEPFurX1u8g9ykVSXMaYviVdfUXVVrhg4dpuuMFgdORNUK/oCID+WGStseG4AAAAASUVORK5CYII="/>
          <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAtklEQVRIS+2TsQ3CMBBF/0mxazaBEcIITELvay4bZQMYATahtyUjSxRWmrvEsUQRt7Heu7xLCJ0PdebjEKiF/y+RiJycc3dmntTxgXVL/sEfAC4AJmYWTWJOVMNzzu+U0igin10EW+FFrr5BC1wVtMJNgmEYnkR0BvCKMV4t3eu9mBK1SFRBmaak2ioxCVokZsFSQkS3EMK8y39QQ0ou7/1ogatfkTad5fmqRBbg8s4hUKt1T/QFxkhmGTtrYfsAAAAASUVORK5CYII="/>
          <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAsUlEQVRIS+3UsQ0CMQwF0G8p6dkERoAN2Ag3Sc0mjMCNAJtQx5GM0iEKYls6ieKuzv0X/yghrPzRyvnYgGnD/1NRKYVF5MrMr+m2PxaYJhjhAC4AHiJy8iAmgJl3KaWFiPZexASMiaOIGYgiLiCChICc8x3AQVWfvffjr0N3AeMcPOFjYjMQCTcD0XAzUGs9q+rN0vn3LTdXNJDW2uK5xeYJPG9PeIIoYq5oA6INTP97A3pmfBkzm1HfAAAAAElFTkSuQmCC"/>
          <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAuUlEQVRIS+2UsQ0DIQxFjQR9NklGSDbIPhRxA3U2yQi5EZJNUgOSI3dRBPgkg645SrD+8/8WNjD5mMn6sAPEhLeNKISAOec7In5qrYYQiO+9981Gmw8sDgA3AHjlnC81iAqAiAdr7WKMObYgKgBblyBqgAQZAuhBhgKcc08AOBHRu5Ry5qEPAfAcauLsTA3oiasBkrgaEGO8EtHjN/P/36yOiCEppWXKqhDX5MqCbbfpyia7ZbsDMcUvbJmsGRiNZuQAAAAASUVORK5CYII="/>
        </li>
      </ul><!--ca-content-content end-->
      <input id="ca-content-popup" type="checkbox" />
      <label for="ca-content-popup">영상 업로드</label>
      <div>
        <div><!--pop-up page start-->
          <label for="ca-content-popup">
            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAABHklEQVRYR+2WUQ6DIAyGiyfbTrJ5DvRJPcf0JNvJZMGNhRikf0ETl8ArFj6+0oqikw11Mh4qQFxGiqFiiDPAzf/3Heq67tK27Ys7pT8vjYENDcNwJ6IHEY1a6xqB6vt+VErdiKjWWo9IDARkT1lV1dNbkIXyYJaweZ6viF0IyC643iBmav2tMWZqmsYaZgcMhELlwNg9REAcVC5MEtAWlDFGfS/wkhZJmvw8ig254MCd+q2bCpNsKAaVA3MIkKRPhUrukJTlQCUBhapp0f3pym6wzXMXQ7HSljTPrQ4pMoT0mVwoGAiBiVQfnD4IaP1zRUr78J+re34gMAFT+z4/3AbSx5aNk8ZAKWPfDDt+UIA4mcVQMcQZ4ObLHeIMvQEbv8ElmHXsTQAAAABJRU5ErkJggg=="/>
          </label><!--첫번째 닫기버튼-->
          <div class="ca-content-upload">





            <div class="ca-upload-page">
              <div class="ca-main-title">
                <span>영상 세부정보</span>
              </div><!--ca-main-title end-->
              <form method="POST" >
                <div class="ca-upload-info">
                  <div class="ca-upload-desc">
                    <div class="ca-upload-box"><!--영상제목-->
                      <div class="ca-upload-title">영상제목</div>
                      <input class="ca-upload-text" type="text" name="title" />
                      <div class="ca-upload-ajax">글자수</div>
                    </div>
                    <div class="ca-upload-box"><!--영상설명-->
                      <div class="ca-upload-title">영상설명</div>
                      <textarea class="ca-upload-text" name="description"></textarea>
                      <div class="ca-upload-ajax">글자수</div>
                    </div>
                    <div class="ca-upload-box"><!--공개여부--><!--1(공개)이 기본값-->
                      <div class="ca-upload-title">공개여부</div>
                      <input type="radio" name="visibility" id="public" value="1"/>
                      <label for="public">공개</label>
                      <input type="radio" name="visibility" id="private" value="0"/>
                      <label for="private">비공개</label>
                    </div>
                  </div><!--ca-upload-desc end-->

                  <div class="ca-upload-video">
                    <div class="ca-upload-box"><!--영상업로드-->
                      <div class="ca-upload-title">영상업로드</div>
                      <video poster="" preload="metadata" autoplay controls  >
                        <source src="image/viverse.mp4" type="video/mp4">
                      </video>
                      <input type="file" name="videofile" />
                    </div>
                    <div class="ca-upload-box"><!--썸네일-->
                      <div class="ca-upload-title">썸네일</div>
                      <input type="file" name="thumbnail" />
                    </div>
                  </div><!--ca-upload-video end-->
                </div><!--ca-upload-info end-->
                <input  type="submit" value="업로드" />
              </form>
            </div><!--ca-upload-page end-->





          </div><!--ca-content-upload end-->
        </div><!--pop-up page end-->
        <label for="ca-content-popup"></label><!--두번째 닫기버튼-->
      </div>
    </div><!--ca-content end-->


  </div><!--ca-main end-->
</div>
</body>
</html>