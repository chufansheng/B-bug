//
//  URLPicture.h
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#ifndef URLPicture_h
#define URLPicture_h

//头条轮播图
#define kTouTiaoHeaderImgUrl @"http://api.iclient.ifeng.com/ClientNews?id=SYLB10,SYDT10,SYRECOMMEND&page=1&gv=4.4.7&av=4.4.7&uid=865528029140351&deviceid=865528029140351&proid=ifengnews&os=android_17&df=androidphone&vt=5&screen=720x1280&publishid=6109"

//头条列表
#define kTouTiaoUrl(page) [NSString stringWithFormat:@"http://api.iclient.ifeng.com/ClientNews?id=SYLB10,SYDT10,SYRECOMMEND&page=%ld&gv=4.6.5&av=0&proid=ifengnews&os=ios_7.1.1&vt=5&screen=640x960&publishid=4002&uid=a98661e83914a230da5223101e0f1b76e14691cb",page]

//娱乐列表
#define kYuLeUrl(page) [NSString stringWithFormat:@"http://api.iclient.ifeng.com/ClientNews?id=YL53,FOCUSYL53&page=%ld&gv=4.4.7&av=4.4.7&uid=865528029140351&deviceid=865528029140351&proid=ifengnews&os=android_17&df=androidphone&vt=5&screen=720x1280&publishid=6109",page]

//体育列表
#define kSportUrl(page) [NSString stringWithFormat:@"http://api.iclient.ifeng.com/ClientNews?id=TY43,FOCUSTY43,TYLIVE&page=%ld&gv=4.4.7&av=4.4.7&uid=865528029140351&deviceid=865528029140351&proid=ifengnews&os=android_17&df=androidphone&vt=5&screen=720x1280&publishid=6109",page]



#define kYingshiUrl(page) [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348648650048/%ld-20.html",page]

//视频URL
#define DHMovieURL @"http://c.3g.163.com/nc/video/home/0-10.html"

//视频详情页
#define kDBMoveURL @"http://img3.cache.netease.com/photo/0003/2015-10-13/B5Q8G0B600B70003.JPG"
//美女
#define kGirlURL(page) [NSString stringWithFormat:@"http://api.3g.ifeng.com/clientShortNews?type=beauty&page=%ld&gv=4.4.7&av=4.4.7&uid=865528029140351&deviceid=865528029140351&proid=ifengnews&os=android_17&df=androidphone&vt=5&screen=720x1280&publishid=6109",page]

#endif /* URLPicture_h */
