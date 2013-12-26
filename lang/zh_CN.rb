# coding: utf-8
Localization.define("zh_CN") do |l|
  l.store "login", "登录"
  l.store "signup", "注册"
  l.store "Preview", "预览"
  l.store "Error occurred while updating Content Type.", "当更新内容类型时发生错误"
  l.store "complete", "完成"
  l.store "Content Type was successfully updated.", "內容类型已被成功更新"
  l.store "Please review and save the settings before continuing", "在继续前请确认和保存配置"
  l.store "It seems something went wrong. Maybe some of your sidebars are actually missing and you should either reinstall them or remove them manually", "有错误发生，可能是一些侧边栏丢失，请尝试重新安装或者手动卸载。"
  l.store "You are not authorized to open this file", "你没有权限打开这个文件"
  l.store "File saved successfully", "文件保存成功"
  l.store "Unable to write file", "无法写入文件"

  # app/controllers/admin/users_controller.rb
  l.store "User was successfully created.", "用户创建成功"

  # app/controllers/application_controller.rb

  # app/controllers/articles_controller.rb
  l.store "No posts found...", "没有文章"
  l.store "Archives for", "归档为"
  l.store "Archives for ", "归档为"

  # app/controllers/grouping_controller.rb
  l.store "page", "页面"

  # app/helpers/admin/base_helper.rb
  l.store "Store", "保存"
  l.store "delete", "删除"
  l.store "Delete content", "删除内容"
  l.store "Please select", "请选择"
  l.store "All categories", "所有类别"
  l.store "All authors", "所有作家"
  l.store "All published dates", "所有日期"
  l.store "There are no %s yet. Why don't you start and create one?", "这儿并不存在%s。让我们开始创建它。"
  l.store "Edit", "修改"
  l.store "Show", "显示"
  l.store "Unpublished", "未发表"
  l.store "Show help on Publify macros", "显示Publify宏的帮助"
  l.store "Back to overview", "回到概览"

  # app/helpers/admin/content_helper.rb
  l.store "Destroy this draft", "删除草稿"

  l.store "Show conversation", "显示对话"
  l.store "Flag as %s", "标记为%s"

  # app/helpers/application_helper.rb
  l.store "no trackbacks", "没有引用"
  l.store "1 trackback", "一条引用"
  l.store "%d trackbacks", "%d条引用"

  # app/helpers/content_helper.rb
  l.store "Posted in", "发表在"
  l.store "no posts", "没有文章"
  l.store "1 post", "一篇文章"
  l.store "%d posts", "%d篇文章"

  # app/models/article.rb

  # app/models/blog.rb
  l.store "Sort alphabetically", "依字母顺序排序"

  l.store "Are you sure you want to delete the category ", "确认删除此分类？"
  l.store "Delete this category", "删除分类"
  l.store "%s Category", "分类%s"

  l.store "(Done)", "(完成)"

  # app/views/admin/content/_attachment.html.erb
  l.store "Remove", "移除"
  l.store "Currently this article has the following resources", "此文章附带了以下资源"
  l.store "You can associate the following resources", "你可以联结下列资源"
  l.store "Really delete attachment", "确定删除附件？"
  l.store "Add another attachment", "新增其他附件"

  l.store "Drafts", "草稿"

  # app/views/admin/content/_form.html.erb
  l.store "Uploads", "上传"
  l.store "Post settings", "发布设定"
  l.store "Publish at", "公开"
  l.store "Are you sure you want to delete this article", "确定删除本篇文章？"
  l.store "Delete this article", "删除本篇文章"
  l.store "Search articles that contain ...", "搜索包含内容的文章 ..."

  # app/views/admin/dashboard/_comments.html.erb
  l.store "Latest Comments", "最近评论"
  l.store "By %s on %s", "%s在%s"

  # app/views/admin/dashboard/_popular.html.erb
  l.store "Most popular", "最受欢迎"
  l.store "Nothing to show yet", "还没有东西"

  # app/views/admin/dashboard/_posts.html.erb
  l.store "Latest Posts", "最近发表"
  l.store "No posts yet, why don't you start and write one", "你还没有发表文章"

  # app/views/admin/dashboard/_publify_dev.html.erb
  l.store "Latest news from the Publify development blog", "Publify开发博客的最新消息"
  l.store "Oh no, nothing new", "没有新消息"

  # app/views/admin/dashboard/_welcome.html.erb
  l.store "Welcome back, %s!", "欢迎回來， %s！"
  l.store "Total posts : %d", "博文总计：%d"
  l.store "Your posts : %d", "你的文章：%d"
  l.store "Total comments : %d", "评论总计：%d"
  l.store "Spam comments : %d", "垃圾评论：%d"
  l.store "Limit to spam", "限制垃圾郵件"
  l.store "Are you sure you want to delete the page", "你確定要刪除此頁？"
  l.store "Delete this page", "刪除此頁"
  l.store "File", "檔案"
  l.store "Are you sure you want to delete this file", "你確定要刪除此檔案？"
  l.store "Delete this file from the webserver?", "從網路伺服器刪除此檔案？"
  l.store "File Uploads", "檔案上載"
  l.store "Enable gravatars", "可以顯示留言大頭貼"
  l.store "Show your email address", "秀出你的email位址"
  l.store "articles on my homepage by default", "預設的首頁文章"
  l.store "articles in my news feed by default", "預設的feed文章"
  l.store "Show full article on feed", "顯示全部feed文章"
  l.store "Search Engine Optimisation", "SEO"
  l.store "New database version", "新資料庫版本"
  l.store "Your database supports migrations", "你的資料庫支援移動"
  l.store "yes", "确认"
  l.store "no", "取消"
  l.store "You have no plugins installed", "你没有plugins可以安置"

  # app/views/admin/sidebar/_publish.html.erb
  l.store "Changes published", "公開變更"

  # app/views/admin/sidebar/_target.html.erb
  l.store "Drag some plugins here to fill your sidebar", "拖曳一些plugins填滿你的sidebar"

  l.store "Display name", "暱稱"
  l.store "Active theme", "執行中主題"
  l.store "Choose a theme", "選擇主題"
  l.store "Really delete user", "確定刪除使用者"
  l.store "Edit User", "修改使用者"
  l.store "New User", "新的使用者"
  l.store "Comments", "评论"
  l.store "Posted by", "貼上"
  l.store "said", "發言"
  l.store "This comment has been flagged for moderator approval.  It won't appear on this blog until the author approves it", "這篇评论被標示為版主所允許的。他不會在博客顯示直到版主承認他。"

  # app/views/articles/_comment_box.html.erb
  l.store "Your name", "你的名稱"
  l.store "Your email", "你的email"
  l.store "Your message", "你的訊息"
  l.store "Comment Markup Help", "评论顯示協助"
  l.store "Preview comment", "預覽评论"
  l.store "No articles found", "没有找到任何文章"
  l.store "is about to say", "这是关于~~"
  l.store "There are", "有"
  l.store "Leave a response", "離開一個回應"
  l.store "Use the following link to trackback from your own site", "從你所屬的網點用隨後的連結去引用"
  l.store "RSS feed for this post", "為本篇提供RSS"
  l.store "trackback uri", "引用URL"
  l.store "Comments are disabled", "评论停用"
  l.store "About", "关于"
  # themes/scribbish/layouts/default.html.erb

  l.store "Trackbacks for", "作為引用"
  l.store "Archives", "归档"

  # vendor/plugins/authors_sidebar/views/content.rhtml

  # vendor/plugins/xml_sidebar/views/content.rhtml
  l.store "Syndicate", "整合發表"
  l.store "A new message was posted to ", "一個新的訊息已被貼上"
  l.store "AIM Presence", "AIM存在"
  l.store "AIM Status", "AIM身分"
  l.store "Action", "開始行動"
  l.store "Activate", "執行中"
  l.store "Add MetaData", "新增MetaData"
  l.store "Add category", "新增分类"
  l.store "Add new user", "新增使用者"
  l.store "Add pattern", "新增樣式"
  l.store "Advanced settings", "進階設定"
  l.store "Allow non-ajax comments", "允許non-ajax评论"
  l.store "Are you sure you want to delete this filter", "你確定要刪除此篩選器？"
  l.store "Are you sure you want to delete this item?", "确认刪除？"
  l.store "Article Attachments", "文章附件"
  l.store "Article Body", "文章主體"
  l.store "Article Content", " 文章內容"
  l.store "Article Options","文章選項"
  l.store "Articles in", "記事"
  l.store "Attachments", "附件"
  l.store "Back to the blog", "回到博客"
  l.store "Basic settings", "基本設定"
  l.store "Blacklist", "列入黑名單"
  l.store "Blog advanced settings", "博客進階設定"
  l.store "Blog settings", "博客設定"
  l.store "Body", "本文主體"
  l.store "Cache was cleared", "cache已清除"
  l.store "Category", "分类"
  l.store "Category could not be created.", "分类不能被設定"
  l.store "Category title", "分类標題"
  l.store "Category was successfully created.", "分类已成功設定"
  l.store "Category was successfully updated.", "分类已成功更新"
  l.store "Change you blog presentation", "修改外觀"
  l.store "Choose password", "密码"
  l.store "Comments and Trackbacks for", "作為评论和引用"
  l.store "Confirm password", "密码确认"
  l.store "Copyright Information", "著作權資訊"
  l.store "Create new Blacklist", "建立黑名單"
  l.store "Create new category", "增加新的分类"
  l.store "Create new page", "設計新的一頁"
  l.store "Create new text filter", "設計新的本文篩選器"
  l.store "Creating comment", "設計评论"
  l.store "Creating text filter", "建立本文篩選器"
  l.store "Creating trackback", "設計引用中"
  l.store "Creating user", "設定使用者"
  l.store "Currently this article has the following ", "將本篇文章接在下列"
  l.store "Currently this article is listed in following categories", "將本篇文章列在以下分类中"
  l.store "Customize Sidebar", "定製側邊欄"
  l.store "Delete this filter", "刪除此篩選器"
  l.store "Design", "設計"
  l.store "Desired login", "登入名稱"
  l.store "Discuss", "詳述"
  l.store "Do you want to go to your blog?", "進入您的博客？"
  l.store "Duration", "持續時間"
  l.store "Edit Article", "修改文章"
  l.store "Edit MetaData", "修改MetaData"
  l.store "Edit this article", "修改本篇文章"
  l.store "Edit this category", "類目編輯"
  l.store "Edit this filter", "修改此篩選器"
  l.store "Edit this page", "修改此頁"
  l.store "Edit this trackback", "修改此引用"
  l.store "Editing User", "修改使用者中中"
  l.store "Editing category", "修改分类"
  l.store "Editing comment", "修改评论"
  l.store "Editing page", "修改頁面中"
  l.store "Editing pattern", "修改樣式"
  l.store "Editing textfilter", "修改本文篩選器"
  l.store "Editing trackback", "修改引用"
  l.store "Empty Fragment Cache", "清空零碎儲存體"
  l.store "Enable plugins", "Enable plugins"
  l.store "Explicit", "Explicit"
  l.store "Extended Content", "擴增內容"
  l.store "Feedback Search", "信息反饋搜尋"
  l.store "Filters", "篩選器"
  l.store "HTML was cleared", "HTML已清除"
  l.store "IP", "IP"
  l.store "Jabber", "Jabber"
  l.store "Jabber account", "Jabber帳目"
  l.store "Jabber account to use when sending Jabber notifications", "當發出jabber通知時使用jabber帳目"
  l.store "Jabber password", "Jabber密码"
  l.store "Key Words", "輸入"
  l.store "Last Comments", "最新评论"
  l.store "Last posts", "最新文章"
  l.store "Last updated", "上一次更新"
  l.store "Latest posts", "最近發文"
  l.store "Limit to unconfirmed", "限制未許可的"
  l.store "Limit to unconfirmed spam", "限制未許可的垃圾郵件"
  l.store "Location", "位置"
  l.store "Logoff", "退出系統"
  l.store "Macro Filter Help", "巨集篩選器協助"
  l.store "Macros", "巨集"
  l.store "Manage", "管理"
  l.store "Manage Articles", "管理文章"
  l.store "Manage Categories", "分类管理"
  l.store "Manage Pages", "管理頁面"
  l.store "Manage Resources", "管理資源"
  l.store "Manage Text Filters", "管理文字過濾"
  l.store "Markup", "審定"
  l.store "Markup type", "審定類型"
  l.store "MetaData", "MetaData"
  l.store "Metadata was successfully removed.", "Metadata已成功被移除"
  l.store "New post", "新的上傳"
  l.store "Not published by Apple", "非經由Apple所發布"
  l.store "Notification", "回報通知"
  l.store "Notified", "通知"
  l.store "Notify on new articles", "新文章通知"
  l.store "Notify on new comments", "新评论通知"
  l.store "Notify via email", "經由email通知"
  l.store "Number of Articles", "文章編號"
  l.store "Number of Comments", "评论編號"
  l.store "Offline", "下線"
  l.store "Older posts", "從前貼上的"
  l.store "Optional Extended Content", "選擇延續內容"
  l.store "Optional Name", "隨意的命名"
  l.store "Optional extended content", "選擇擴增內容"
  l.store "Page Body", "頁面本文"
  l.store "Page Content", "頁面內容"
  l.store "Page Options", "頁面選擇"
  l.store "Parameters", "參數"
  l.store "Password Confirmation", "密码确认"
  l.store "Pattern", "樣式"
  l.store "Pictures from", "圖像顯示從~"
  l.store "Post", "Post"
  l.store "Post title", "貼上標題"
  l.store "Post-processing filters", "篩選上傳處理"
  l.store "Posted at", "上傳"
  l.store "Posted date", "貼上日期"
  l.store "Posts", "貼出 "
  l.store "Preview Article", "先前文章"
  l.store "Read", "讀取"
  l.store "Read more", "閱讀更多"
  l.store "Rebuild cached HTML", "重建HTML儲存體"
  l.store "Recent comments", "最近评论"
  l.store "Recent trackbacks", "最近引用"
  l.store "Regex", "正規表示法"
  l.store "Remove iTunes Metadata", "移除iTunes Metadata"
  l.store "Resource MetaData", "MetaData資源"
  l.store "Resource Settings", "資源設定"
  l.store "Save Settings", "儲存設定"
  l.store "See help text for this filter", "查看協助針對此篩選器"
  l.store "Set iTunes metadata for this enclosure", "設定附件的iTunes metadata"
  l.store "Setting for channel", "設定頻道"
  l.store "Settings", "設定"
  l.store "Show Help", "顯示協助"
  l.store "Show this article", "秀出文章"
  l.store "Show this category", "秀出分类"
  l.store "Show this comment", "秀出评论"
  l.store "Show this page", "秀出此頁"
  l.store "Show this pattern", "秀出樣式"
  l.store "Show this user", "顯示使用者"
  l.store "Spam Protection", "垃圾郵件防護"
  l.store "Statistics", "統計資訊"
  l.store "String", "字串"
  l.store "Subtitle", "副標題"
  l.store "Summary", "概要"
  l.store "System information", "系統資訊"
  l.store "Text Filter Details", "本文篩選器細節"
  l.store "Text Filters", "本文篩選器"
  l.store "Textfilter", "文章篩選"
  l.store "The below settings act as defaults when you choose to publish an enclosure with iTunes metadata", "當你決定藉iTunes metadata來發佈一個附件，以下行為會被當成預設的"
  l.store "Things you can do", "你可以做的事"
  l.store "This option let you choose between the simple admin interface or the complete one, displaying much more options and therefore more complicated to use. For advanced users only.", "只讓進階使用者選擇簡單或完整的界面，顯示更多更複雜的選項"
  l.store "Toggle Extended Content", "切換擴增內容"
  l.store "Type", "型態"
  l.store "Publify admin", "Publify管理員"
  l.store "Publify documentation", "Publify文件"
  l.store "Update your profile or change your password", "請更新您的個人資料或者修改密码"
  l.store "Upload a new File", "上載一個新檔案"
  l.store "Upload a new Resource", "上傳一個新的資源"
  l.store "Uploaded", "上載"
  l.store "User's articles", "使用者文章"
  l.store "View", "查看"
  l.store "View article on your blog", "在你的博客查看文章"
  l.store "View comment on your blog", " 查看评论"
  l.store "View page on your blog", "在你的博客查看頁面"
  l.store "What can you do ?", "你可以做什麼？"
  l.store "Which settings group would you like to edit", "你要修改哪一個設定群組？"
  l.store "Write Page", "撰寫頁面"
  l.store "Write Post", "寫博客"
  l.store "Write a Page", "編寫本頁"
  l.store "Write an Article", "編寫文章"
  l.store "XML Syndication", "XML簡易整合"
  l.store "You are now logged out of the system", "您已經登出系統"
  l.store "You can add it to the following categories", "你可以新增至以下分类中"
  l.store "You can optionally disable non-Ajax comments. Publify will always use Ajax for comment submission if Javascript is enabled, so non-Ajax comments are either from spammers or users without Javascript.", "你可以隨意地讓non-Ajax评论無效。如果Javascript是有效的，對於提交评论publify會使用ajax，所以non-Ajax的评论是因為使用者或spammper没有使用Javascript。"
  l.store "add new", "新增"
  l.store "by", "by"
  l.store "by %s on %s", "由%s在%s"
  l.store "no ", "no "
  l.store "on", "の"
  l.store "seperate with spaces", "空間區分"
  l.store "via email", "經由email"
  l.store "with %s Famfamfam iconset %s", "%s 個Famfamfam iconset %s"
  l.store "your blog", "你的博客"
end
