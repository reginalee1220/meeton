<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>즐겨찾기</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/css/default/import.css">
    <link rel="stylesheet" type="text/css" href="/css/mypick/bookmark.css" />

    <!-- js -->
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="/js/mypick/jquery.bxslider.js"></script>

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<div id="mypick"><!-- mypick -->
    <div class="bookmark_title"><!-- bookmark_title -->
        <div class="bookmark_title_inner">
            <h2>즐겨찾기</h2>
        </div>
    </div><!-- // bookmark_title -->
    <main class="my_content"><!-- my_content -->
        <form>
            <div class="btn_channel_bmk" id="btn_channel"><!-- btn_channel_bmk -->
                <div class="btn">
                    <input type="button" id="recent_sequence" class="btn_recent" value="최신등록순">
                </div>
                <btn class="btn">
                    <input type="button" id="aka_sequence" class="btn_aka" value="닉네임 순">
                </btn>
                <btn class="btn">
                    <input type="button" id="old_sequence" class="btn_old" value="오래된 순">
                </btn>
            </div><!-- // btn_channel_bmk -->
            <script type="text/javascript">
                $(document).ready(function(){
                    $('.my_chbmk').bxSlider({
                        slideWidth: 300,
                        minSlides: 4,
                        maxSlides: 4,
                        auto:true,
                        autoHover:true,
                        slideMargin:22
                    });
                });
            </script>
            <section class="my_chbmk_wrap"><!-- my_chbmk_wrap -->
                <div class="my_chbmk"><!-- my_chbmk -->
                    <div class="chbmk_item">
                        <a href="#">
                            <div class="profile_img">
                                <img src="/images/mypick/profile-img.jpeg" />
                            </div>
                            <div class="chbmk_mybox_name">채널이름</div>
                        </a>
                        <div class="chbmk_mybox_desc">최근업로드 2021-11-15</div>
                    </div>
                    <div class="chbmk_item">
                        <a href="#">
                            <div class="profile_img">
                                <img src="data:image/png;base64,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" width="80"/>
                            </div>
                            <div class="chbmk_mybox_name">채널이름</div>
                        </a>
                        <div class="chbmk_mybox_desc">최근업로드 2021-11-15</div>
                    </div>
                    <div class="chbmk_item">
                        <a href="#">
                            <div class="profile_img">
                                <img src="data:image/png;base64,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" width="80"/>
                            </div>
                            <div class="chbmk_mybox_name">채널이름</div>
                        </a>
                        <div class="chbmk_mybox_desc">최근업로드 2021-11-15</div>
                    </div>
                    <div class="chbmk_item">
                        <a href="#">
                            <div class="profile_img">
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGwAAABsCAYAAACPZlfNAAAHrUlEQVR4Xu2djW3dNhDHSS0gcoI6E9SZoM4EcSaIM0HcCepOUGeCOBPUmaD2BLUnqD0BqQXE4m9Q6evDs3SkSPFok4ABA0+iTvfj8eN4PEnRSlUakFVJ24QVDVhljaABa8Aq00Bl4jYLa8Aq00Bl4jYLa8Aq00Bl4lZtYcYYJYT4RQhxLKU8EUIc+b9dDHdCCOucuxFC4P9brbWtjNMPcasEZox5L6U8E0KcRir+2jl3pbX+Hnl/sduqAmaM+SilvDhgRbEKfHDOXWitv8VWsPV9VQAzxqDL+4quL5OC7pxzn7TW6DJZF/bAjDGfpZSXW2jROXeutf6yxbNin8Ea2DAMX51zGKs2K1LKq77vP232wMAHsQSG2Z+U8q+MXeCSmtBFvuM4m2QJzFr754oZ4BIM6u/XSqkP1Iu3uo4dMGPMpZTy81YKmHuOc+6L1vqcgyyTDKyAGWNOpZSwrtBy7xfG11gkT7M9zC6FEFhco14srH8Ordg590FrjXpZFDbA/Lj1j1cwVTm3fmZHmo4bY078Og7eEWqBl+QNl/GMDbBhGK6ccx+JWhycc6daa7ibgou35CshRE+5WUr5re/7TWerz8nFApgx5khKCeuiFHR/Z2sXuX4xDmikbtJb2QNFwJzXsAAWYF2wrKNU3ZPvhgFh0dK4WFlxYAFjF2CdrLWs/dbvLe1vglWwGMs4ADvzfsJZnTnnftdaw/GbvBhjLqSUvy1V7P2N6EaLleLAhmHAVsf7BQ0k7QoPWBk8K4tdo5Tye9/3sVs6SSAXB2atNUtTeefcr1rrrA5gopVZpZROovnISooCo84OnXNvU49dsWNZ6dliaWBYyMLJO1celVLY+s9erLXoFn+ae5B3Cket/1K8QGlglMH+VikFt1L2Yq0FiFkvyBbd89yLsge2pQOW4njOOVultMgagGWbzh8YxxYtvgFbWP80C/t/syptYedSyj8WuoI2hu0oqDQwyizxQSn1htK/r73GWgsH9OyM9LXPEkle+rYO+68pFrUwiGGtRdj0rLd8i4Ge6OkYlFLYwS5WigMj+hKzesqpOwbNlyiEMMY0b32AvRa3sJBNxBxjWcB+WNYdAyqz4sAgaMCOc9KukdoVQsa247zTpKhee39LkoMLoQcsSnvpJ3WxsLBAK3uaXPp4wSivuY+awmkY0oyPi3U9WTq178x9XchYtiPLjZ/yk8D5uESEAoR4/1mMXewsDAKtiPy9k1LejOOICN1hL/K377ruFAE8MYcrWuTvgqlStjhyW/tU/5aOZ+o7sekSdwUmLqap7xh1HYdF8iHBWQLz4xnGJVJUbhSR+ZsQXYwYSHbZBlgCm3QZsD5LxozTjLAaC9sV1BhD2TNLAqx0vAblJVhb2PQCoQcXKC++d03QsaWI+pPdUgWwHXBwFCNcezYULUA7jz5PR9Hw6wB5+SycQ4TGeq3rujNCiPfBajEDHMcRmXDYnKykvn9VFrb/Uj7X1NOC2B+Jhatpf2Z5v5dr6obj7O9VAKO+5Eu6rmoLe0kgqO/SgFE1xeS6BowJCKoY7IFhc9NP4w8lr6S+59J1OLWCv0etdfGD53PCsgI2ZRjtuu4kdjtkiQzx92m7Bv5MVhlMWQBDhlG/Z8UiF8Y+VGR4w14bhwymRYFlyDBKNKDoy4pnMC0CzIPCmWVSTEW0evPdWAzcpsC8ExenVUJiKvKpfX3NiCnBgXlSrqv1j9swCGfLVLApFBNSx5apZ7NbmN89RkhZ0fwWIQAir0W+ESR6zrpLnRUYg1SwkbqPvi176tlswEIjaxdUdItMNeM4ZlnUdl137JybvjIRTcvfmCQy+TkhsgBLYFkIgsGmIrZCNhvQoSSfxRQnQ7EmjA0CymZpyYGtgYUAmHEcL7eG9FxrBryu684DEm/uVpUFWnJgMRmx/Q4wkvxn6fLW9nHwZ3Zddxmxw508M3dSYBERTohbR3bRKrbqQ1PPoqGkjsRKBizgYNzU4DFOIW8vS6ua6SZxkB4NjDy+pTyImAyYtRZJvkgeDN8FwrKyrlnWdoUz0FTXdUgqvZTncariRin1LoU8SYBRzylDYK4x6zHKDDkDkCqbaRJglCSVXiFsY9ZjgAWeAUiSIGY1sADrwgTjuLYxawmkP+6LteJiZu4UVrYaGCXdj58tsfokxhKIkN8DDiKutrJVwKiCvqRx6zmQ1PFs7YnOVcCox4G4nMAPsZrQa6mZENYeZ4oG5gdcZMSeLWsFXKqf0+8BDVjHLmnWACN9OirlopETnEOyUJ0Ha7rFNcAoH2a7V0rl+jIsS37WWswYZ70gaw67RwOz1uJ7JbMwUvvRWBLaE4roT71TSr2NeZ81wNzSA19TdzjpgtotKqWidB91U26hlhoC99+ttZTGjK/+BTu+Y4FRcvVullyZG0DiBwvw2WFSyqXd94sFtpiU8jVN5/cbDGURHeumigXGPiF/Sauj5A+OzWPcgGUg24BlUGrOKhuwnNrNUHcDlkGpOatswHJqN0PdHIEh2GYp4AZRu8HrjAz627xKpKrNpZ+oWeLmGmgP/KGBBqyyxtCANWCVaaAycZuFNWCVaaAycZuFNWCVaaAycZuFNWCVaaAycZuFNWCVaaAycZuFVQbsX3HdX6mPFPLuAAAAAElFTkSuQmCC" width="80"/>
                            </div>
                            <div class="chbmk_mybox_name">채널이름</div>
                        </a>
                        <div class="chbmk_mybox_desc">최근업로드 2021-11-15</div>
                    </div>
                    <div class="chbmk_item">
                        <a href="#">
                            <div class="profile_img">
                                <img src="data:image/png;base64,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" width="80"/>
                            </div>
                            <div class="chbmk_mybox_name">채널이름</div>
                        </a>
                        <div class="chbmk_mybox_desc">최근업로드 2021-11-15</div>
                    </div>
                    <div class="chbmk_item">
                        <a href="#">
                            <div class="profile_img">
                                <img src="data:image/png;base64,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" width="80"/>
                            </div>
                            <div class="chbmk_mybox_name">채널이름</div>
                        </a>
                        <div class="chbmk_mybox_desc">최근업로드 2021-11-15</div>
                    </div>
                    <div class="chbmk_item">
                        <a href="#">
                            <div class="profile_img">
                                <img src="data:image/png;base64,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" width="80"/>
                            </div>
                            <div class="chbmk_mybox_name">채널이름</div>
                        </a>
                        <div class="chbmk_mybox_desc">최근업로드 2021-11-15</div>
                    </div>

                </div><!-- // my_chbmk -->
            </section><!-- // my_chbmk_wrap -->
        </form>
    </main><!-- // my_content -->


</div><!-- // mypick -->

</body>
</html>