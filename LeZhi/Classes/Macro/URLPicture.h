//
//  URLPicture.h
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#ifndef URLPicture_h
#define URLPicture_h

#define kTouTiaoUrl(page) [NSString stringWithFormat:@"http://api.iclient.ifeng.com/ClientNews?id=SYLB10,SYDT10,SYRECOMMEND&page=%ld&gv=4.6.5&av=0&proid=ifengnews&os=ios_7.1.1&vt=5&screen=640x960&publishid=4002&uid=a98661e83914a230da5223101e0f1b76e14691cb",page]

//#define URLMove @"http://c.3g.163.com/nc/article/list/T1348648650048/0-20.html"

#define kYingshiUrl(page) [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348648650048/%ld-20.html",page]

//视频URL
#define DHMovieURL @"http://c.3g.163.com/nc/video/home/0-10.html"

#endif /* URLPicture_h */