#import "lib.typ": *

#set heading(numbering: numbly("{1:一}、", default: "1.1  "))

#show: ori.with(
  title: [高等数学(下)\ 速效救心丸],
  short-title: [高数下速效救心丸],
  // 笔记描述（选填）
  description: [
    本文档由“REKPARC-SPST-LZU-UHT” #link("https://github.com/Monika-shipship/REKPARC-SPST-LZU-UHT", box(height: 1.1em, baseline: 13.5%)[#image.decode(githubSvg)]) 项目组编写，如你也有相关笔记或资料，欢迎参与贡献!（点击上方github图标可跳转链接） 或者可以邮件传递你的资料:"lzuanonymous\@qq.com"
  ],
  // 笔记创建日期（选填）
  date: datetime(year: 2025, month: 6, day: 24),
  authors: (
    (
      name: "Monika",
      //github: "https://github.com/a-kkiri",
      //homepage: "https://github.com/a-kkiri",
      affiliations: "1,2",
    ),
    
  ),

  // 所属组织列表，每一项包括一个 id 和 name。这些将显示在作者下方。
  affiliations: (
    (id: "1", name: "zako University"),
    // (id: "2", name: "514 Inc."),
    
  ),
  // 学期
  semester: "2025 春",
  // 参考书目文件路径及引用样式
  bibliography-file: "refs.bib",
  bibstyle: "gb-7714-2015-numeric",
  // 是否生成标题和目录
  maketitle: true,
  makeoutline: true,
  // 主题色
  accent: blue,
  // 封面背景图片（选填图片路径或 none）
  // cover-image: "./figures/cover-image.png",
  // 正文背景颜色（选填 HEX 颜色或 none）
  // background-color: "#FAF9DE",

  theme: "dark", //此处有bug
  // media: "screen",
)

#include "content/charpter1.typ"
// #include "content/charpter2.typ"