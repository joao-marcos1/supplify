# coding: utf-8
Localization.define("ja_JP") do |l|

  # app/controllers/accounts_controller.rb
  l.store "Login successful", "ログインしました"
  l.store "Login unsuccessful", "ログインに失敗しました"
  l.store "Oops, something wrong just happened", ""
  l.store "Successfully logged out", "ログアウトしました"
  l.store "login", "ログイン"
  l.store "signup", "サインアップ"
  # app/controllers/admin/content_controller.rb
  l.store "Error, you are not allowed to perform this action", "あなたのアカウントではこの操作は許可されていません"
  l.store "Preview", ""
  l.store "Article was successfully created", "記事を作成しました"
  l.store "Article was successfully updated.", "記事が更新されました"

  l.store "Not found", ""
  l.store "Marked %d item(s) as Ham", ""
  l.store "Confirmed classification of %s item(s)", ""
  l.store "Not implemented", ""
  l.store "Page was successfully created.", "ページが作成されました"
  l.store "Page was successfully updated.", "ページが更新されました"

  # app/controllers/admin/resources_controller.rb
  l.store "Error occurred while updating Content Type.", "コンテントタイプを更新中にエラーが発生しました"
  l.store "complete", "完了"
  l.store "File uploaded: ", "アップロードするファイル: "
  l.store "Unable to upload", "アップロードできません"
  l.store "Metadata was successfully updated.", "メタデータは正常に更新されました"
  l.store "Not all metadata was defined correctly.", "いくつかのメタデータが正しく反映されませんでした"
  l.store "Content Type was successfully updated.", "コンテントタイプは正常に更新されました"
  l.store "config updated.", "設定は更新されました"
  l.store "delete", "削除"
  l.store "Please select", "選択してください"
  l.store "There are no %s yet. Why don't you start and create one?", ""
  l.store "Edit", "編集"
  l.store "Show help on Publify macros", "Publifyマクロのヘルプを表示"
  l.store "Back to overview", "オーバービューに戻る"
  l.store "%%a, %%d %%b %%Y %%H:%%M:%%S GMT", Proc.new { |date| sprintf(date.strftime("%Y-%m-%d %H:%M:%S GMT")) }
  l.store "%%d. %%b", Proc.new { |date| sprintf(date.strftime("%m/%d")) }
  l.store "no trackbacks", "トラックバックなし"
  l.store "Unclassified", "未分類"
  l.store "Just Presumed Ham", "承認と推定"
  l.store "Ham?", "承認?"
  l.store "Just Marked As Ham", "承認マーク"
  l.store "Spam?", "スパム?"
  l.store "Just Marked As Spam", "スパムマーク"
  l.store "Reorder", "並べ替え"
  l.store "Sort alphabetically", "アルファベット順に並べ替え"
  l.store "Are you sure you want to delete the category ", "このカテゴリを削除してもよろしいですか？ "
  l.store "Delete this category", "このカテゴリを削除"
  l.store "(Done)", "(完了)"

  # app/views/admin/content/_attachment.html.erb
  l.store "Remove", "削除"
  l.store "Currently this article has the following resources", "現在この記事には以下のリソースが含まれています"
  l.store "You can associate the following resources", "以下のリソースを整理することができます"
  l.store "Really delete attachment", "本当に添付ファイルを削除してもよろしいですか？"
  l.store "Add another attachment", "添付ファイルを追加"

  l.store "Uploads", "アップロード"
  l.store "Post settings", "投稿設定"
  l.store "Publish at", "公開日"

  # app/views/admin/content/destroy.html.erb
  l.store "Are you sure you want to delete this article", "本当にこの記事を削除してよろしいですか？"
  l.store "Delete this article", "この記事を削除"

  l.store "Search articles that contain ...", "以下の語句を含む記事を検索"

  # app/views/admin/dashboard/_popular.html.erb
  l.store "Most popular", "人気記事"
  l.store "Welcome back, %s!", "お帰りなさいませ、%s 様"
  l.store "Total posts : %d", "総投稿数"
  l.store "Your posts : %d", "あなたの投稿数"
  l.store "Total comments : %d", "総コメント数"
  l.store "Spam comments : %d", "スパムコメント数"
  l.store "All comments", "全てのコメント"
  l.store "Limit to ham", "有効コメント"
  l.store "Limit to spam", "スパムコメント"
  l.store "Search Comments and Trackbacks that contain", "以下の語句を含むコメントおよびトラックバックを検索"
  l.store "Page settings", "ページ設定"
  l.store "Are you sure you want to delete the page", "本当にこのページを削除してよろしいですか？"
  l.store "Delete this page", "このページを削除"
  l.store "Your profile", "あなたのプロフィール"
  l.store "File", "ファイル"
  l.store "Are you sure you want to delete this file", "本当にこのファイルを削除してよろしいですか？"
  l.store "Delete this file from the webserver?", "webサーバーからこのファイルを削除しますか？"
  l.store "File Uploads", "ファイルアップロード"
  l.store "Enable gravatars", "Gravatarを有効にする"
  l.store "Show your email address", "メールアドレスを表示"
  l.store "articles on my homepage by default", "ホームページのデフォルト記事数"
  l.store "articles in my news feed by default", "RSSフィードのデフォルト記事数"
  l.store "Show full article on feed", "記事の全文をフィードに表示"

  # app/views/admin/settings/seo.html.erb
  l.store "Format of permalink", "パーマリンクの書式"
  l.store "Index categories", "カテゴリのインデックス"
  l.store "Unchecking this box will add <code>noindex, follow</code> meta tags in every category page, removing them from search engines and preventing duplicate content issues", "このボックスのチェックを外すと、全てのカテゴリのページに<code>noindex, follow</code>のMETAタグを付与します。すると検索エンジンからそれらのページが削除され、コンテンツ重複の防止になります"
  l.store "Index tags", "タグのインデックス"
  l.store "Unchecking this box will add <code>noindex, follow</code> meta tags in every tags page, removing them from search engines and preventing duplicate content issues", "このボックスのチェックを外すと、全てのタグのページに<code>noindex, follow</code>のMETAタグを付与します。すると検索エンジンからそれらのページが削除され、コンテンツ重複の防止になります"
  l.store "Search Engine Optimization", "検索エンジン最適化"
  l.store "New database version", "新しいデータベースのバージョン"
  l.store "Your database supports migrations", "あなたのデータベースはマイグレーションをサポートしています"
  l.store "yes", "はい"
  l.store "no", "いいえ"
  l.store "You have no plugins installed", "プラグインがインストールされていません"
  l.store "Changes published", "変更して公開"
  l.store "Drag some plugins here to fill your sidebar", "サイドバーで利用するプラグインをドラッグしてください"
  l.store "Get more plugins", "他のプラグインの入手"
  l.store "Display name", "表示名"
  l.store "Manage tags", "タグの管理"

  # app/views/admin/themes/catalogue.html.erb
  l.store "Sorry the theme catalogue is not available", ""
  l.store "Theme catalogue", "テーマカタログ"

  # app/views/admin/themes/index.html.erb
  l.store "Active theme", "現在のテーマ"
  l.store "Choose a theme", "テーマの選択"
  l.store "Password confirmation", "パスワード（確認用）"
  l.store "Active", "有効"
  l.store "Inactive", "無効"
  l.store "Firstname", "姓"
  l.store "Lastname", "名"
  l.store "Nickname", "ニックネーム"
  l.store "Editor", "エディタ"
  l.store "Send notification messages via email", "メールで通知を送信"
  l.store "Send notification messages when new articles are posted", "新しい記事が投稿された際に通知メッセージを送る"
  l.store "Send notification messages when comments are posted", "コメントが投稿された際に通知メッセージを送る"
  l.store "Contact options", ""
  l.store "Your site", "あなたのホームページ"
  l.store "display URL on public profile", "公開プロフィールにURLを表示"
  l.store "Your MSN", "あなたのMSN ID"
  l.store "display MSN ID on public profile", "公開プロフィールにMSN IDを表示"
  l.store "Your Yahoo ID", "あなたのYahoo ID"
  l.store "display Yahoo! ID on public profile", "公開プロフィールにYahoo! IDを表示"
  l.store "Your Jabber ID", "あなたのJabber ID"
  l.store "display Jabber ID on public profile", "公開プロフィールにJabber IDを表示"
  l.store "Your AIM id", "あなたのAIM ID"
  l.store "display AIM ID on public profile", "公開プロフィールにAIM IDを表示"
  l.store "Your Twitter username", "あなたのTwitter ID"
  l.store "display Twitter on public profile", "公開プロフィールにTwitter IDを表示"
  l.store "Tell us more about you", "補足事項"
  l.store "Really delete user", "本当にユーザーを削除"
  l.store "Yes", "はい"
  l.store "Edit User", "ユーザー編集"
  l.store "New User", "新規ユーザー"
  l.store "Comments", "コメント"
  l.store "State", "状態"
  l.store "%s user", "%s"
  l.store "Add User", "ユーザーの追加"
  l.store "Posted by", "投稿者"
  l.store "said", "発言"
  l.store "This comment has been flagged for moderator approval.  It won't appear on this blog until the author approves it", "このコメントはモデレーターの確認が必要です。モデレーターが確認後にコメントが表示されます。"

  l.store "Your name", "あなたの名前"
  l.store "Your email", "あなたのemail"
  l.store "Your message", "メッセージ"
  l.store "Comment Markup Help", "コメントのマークアップヘルプ"
  l.store "Preview comment", "前のコメント"
  l.store "From", "From"
  l.store "No articles found", "記事が見つかりませんでした"
  l.store "is about to say", "〜について言う"
  l.store "There are", "ここに"
  l.store "Leave a response", "コメントを書く"
  l.store "Use the following link to trackback from your own site", "トラックバックリンク"
  l.store "RSS feed for this post", "この記事のRSSフィード"
  l.store "trackback uri", "トラックバックURL"
  l.store "Comments are disabled", "コメントは許可されていません"
  l.store "Continue reading...", "続きを読む‥"
  l.store "Trackbacks for", "〜へのトラックバック"
  l.store "Archives", "アーカイブ"
  l.store "Authors", "作者"
  l.store "Syndicate", "シンジゲート"
  l.store "Category %s", ""
  l.store "Tag %s", ""
  l.store "A new message was posted to ", "〜へ新しいメッセージを投稿しました"
  l.store "Action", "アクション"
  l.store "Activate", "有効にする"
  l.store "Add MetaData", "メタデータ追加"
  l.store "Add category", "カテゴリ追加"
  l.store "Add new user", "新しいユーザーを追加"
  l.store "Add pattern", "パターン追加"
  l.store "Allow non-ajax comments", "Ajaxでないコメントを許可する"
  l.store "Are you sure you want to delete this filter", "このフィルターを削除してもよろしいですか？"
  l.store "Are you sure you want to delete this item?", "この項目を削除してもよろしいですか？"
  l.store "Articles in", "記事"
  l.store "Attachments", "添付"
  l.store "Blacklist", "ブラックリスト"
  l.store "Blacklist Patterns", "ブラックリストパターン"
  l.store "Blog settings", "ブログ設定"
  l.store "Cache was cleared", "キャッシュはクリアされました"
  l.store "Category", "カテゴリ"
  l.store "Category could not be created.", "カテゴリは追加できませんでした"
  l.store "Category was successfully created.", "カテゴリは正常に作成されました"
  l.store "Category was successfully updated.", "カテゴリは正常に更新されました。"
  l.store "Change you blog presentation", "プログの説明を変更してください。"
  l.store "Choose password", "パスワード"
  l.store "Comment Excerpt", "コメント抜粋"
  l.store "Confirm Classification of Checked Items", "チェックした行の分類を認める"
  l.store "Confirm password", "パスワード再入力"
  l.store "Contact options", "連絡オプション"
  l.store "Copyright Information", "著作権情報"
  l.store "Create new Blacklist", "新しいブラックリスト作成"
  l.store "Create new category", "新規カテゴリ追加"
  l.store "Create new page", "新しいページを作成"
  l.store "Create new text filter", "新しいテキストフィルターを作成"
  l.store "Creating comment", "コメント作成"
  l.store "Creating text filter", "テキストフィルター作成"
  l.store "Creating trackback", "トラックバックを作成"
  l.store "Creating user", "ユーザー作成"
  l.store "Currently this article is listed in following categories", "現在この記事は以下のカテゴリに追加されています"
  l.store "Customize Sidebar", "サイドバーのカスタマイズ"
  l.store "Delete this filter", "このフィルターを削除"
  l.store "Desired login", "ログイン名"
  l.store "Do you want to go to your blog?", "ブログに移動しますか？"
  l.store "Duration", "継続時間"
  l.store "Edit Article", "記事を編集"
  l.store "Edit MetaData", "メタデータ編集"
  l.store "Edit this article", "この記事を編集"
  l.store "Edit this category", "このカテゴリを編集"
  l.store "Edit this filter", "このフィルターを編集"
  l.store "Edit this page", "このページを編集"
  l.store "Edit this trackback", "このトラックバックを編集"
  l.store "Editing User", "ユーザー編集中"
  l.store "Editing category", "カテゴリ編集中"
  l.store "Editing comment", "コメント編集中"
  l.store "Editing page", "ページを編集中"
  l.store "Editing pattern", "パターン編集中"
  l.store "Editing textfilter", "テキストフィルターを編集中"
  l.store "Editing trackback", "トラックバックを編集"
  l.store "Enable plugins", "プラグイン有効化"
  l.store "Explicit", "明示的コンテンツ"
  l.store "Feedback for", "フィードバック: "
  l.store "Filters", "フィルター"
  l.store "Fri", "金"
  l.store "Friday",    "金曜日"
  l.store "HTML was cleared", "HTMLはクリアされました"
  l.store "IP", "IPアドレス"
  l.store "Key Words", "キーワード"
  l.store "Last Comments", "最新のコメント"
  l.store "Last posts", "最新の記事"
  l.store "Last updated", "最終更新日"
  l.store "Logoff", "ログアウト"
  l.store "Macro Filter Help", "マクロフィルターヘルプ"
  l.store "Macros", "マクロ"
  l.store "Manage Articles", "記事管理"
  l.store "Manage Categories", "カテゴリ管理"
  l.store "Manage Resources", "リソース管理"
  l.store "Manage Text Filters", "テキストフィルターの管理"
  l.store "Mandatory", "必須"
  l.store "Markup", "マークアップ"
  l.store "Markup type", "マークアップタイプ"
  l.store "MetaData", "メタデータ"
  l.store "Metadata was successfully removed.", "メタデータは正常に削除されました"
  l.store "Mon", "月"
  l.store "Monday",    "月曜日"
  l.store "New post", "新規記事"
  l.store "No", "いいえ"
  l.store "Not published by Apple", "Appleに公開しない"
  l.store "Notification", "通知"
  l.store "Notified", "通知"
  l.store "Notify on new articles", "新しい記事を通知"
  l.store "Notify on new comments", "新しいコメントを通知"
  l.store "Notify via email", "email経由で通知"
  l.store "Number of Articles", "記事数"
  l.store "Number of Comments", "コメント数"
  l.store "Older posts", "古い記事"
  l.store "Optional Name", "オプション名"
  l.store "Options", "オプション"
  l.store "Page", "ページ"
  l.store "Parameters", "パラメーター"
  l.store "Pattern", "パターン"
  l.store "Personal information", "個人情報"
  l.store "Pictures from", "〜からの画像"
  l.store "Podcasts", "ポッドキャスト"
  l.store "Post-processing filters", "投稿処理フィルター"
  l.store "Posted date", "投稿日"
  l.store "Posts", "投稿数"
  l.store "Preview Article", "前の記事"
  l.store "Read", "表示"
  l.store "Read more", "続きを読む"
  l.store "Recent comments", "最近のコメント"
  l.store "Recent trackbacks", "最近のトラックバック"
  l.store "Regex", "正規表現"
  l.store "Remove iTunes Metadata", "iTunesのメタデータを削除"
  l.store "Resource MetaData", "リソースメタデータ"
  l.store "Sat", "土"
  l.store "Saturday",  "土曜日"
  l.store "See help text for this filter", "このフィルターのヘルプを見る"
  l.store "Set iTunes metadata for this enclosure", "このリソースにiTunesのメタデータをセット"
  l.store "Setting for channel", "チャンネル設定"
  l.store "Show Help", "ヘルプを表示"
  l.store "Show this article", "この記事を表示"
  l.store "Show this category", "カテゴリ表示"
  l.store "Show this comment", "このコメントを表示"
  l.store "Show this page", "このページを表示"
  l.store "Show this pattern", "パターンを表示"
  l.store "Show this user", "このユーザーを表示"
  l.store "Statistics", "統計データ"
  l.store "String", "文字列"
  l.store "Subtitle", "サブタイトル"
  l.store "Summary", "サマリー"
  l.store "Sun", "日"
  l.store "Sunday",    "日曜日"
  l.store "System information", "システム情報"
  l.store "Text Filter Details", "テキストフィルター詳細"
  l.store "Text Filters", "テキストフィルター"
  l.store "The below settings act as defaults when you choose to publish an enclosure with iTunes metadata", "以下の項目は、公開を選択した場合にデフォルトのiTunesのメタデータとして設定されます"
  l.store "Themes", "テーマ"
  l.store "Thu", "木"
  l.store "Thursday",  "木曜日"
  l.store "Tue", "火"
  l.store "Tuesday",   "火曜日"
  l.store "Type", "タイプ"
  l.store "Publify documentation", "Publifyドキュメント"
  l.store "Update your profile or change your password", "プロファイルを更新するか、パスワードを変更してください"
  l.store "Upload a new File", "新規ファイルをアップロード"
  l.store "Upload a new Resource", "新しいリソースをアップロード"
  l.store "Uploaded", "アップロード"
  l.store "User's articles", "ユーザーの記事"
  l.store "View article on your blog", "ブログで記事を確認"
  l.store "View comment on your blog", "ブログにコメントを表示"
  l.store "View page on your blog", "ブログでページを確認"
  l.store "Wed", "水"
  l.store "Wednesday", "水曜日"
  l.store "What can you do ?", "なにができますか？"
  l.store "Write Page", "ページを作成"
  l.store "Write Post", "記事を書く"
  l.store "Write a Page", "ページを書く"
  l.store "Write an Article", "記事を書く"
  l.store "You are now logged out of the system", "システムからログアウトしました"
  l.store "You can add it to the following categories", "以下のカテゴリへ追加することができます"
  l.store "You can optionally disable non-Ajax comments. Publify will always use Ajax for comment submission if Javascript is enabled, so non-Ajax comments are either from spammers or users without Javascript.", "オプションでAjaxでないコメントを不許可にすることができます。Javascriptが有効な場合、Publifyは常にコメントの受け渡しにAjaxを使います。つまりAjaxでないコメントはJavascriptを有効にしていないユーザーのものか、スパマーのものかのどちらかでしょう。"
  l.store "add new", "新規追加"
  l.store "by", "by"
  l.store "no ", "no "
  l.store "on", "の"
  l.store "seperate with spaces", "スペースで分ける"
  l.store "unpublished", "未公開"
  l.store "via email", "email経由"
  l.store "your blog", "ブログ"
end
