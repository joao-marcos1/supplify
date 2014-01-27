# coding: utf-8
Localization.define("ja_JP") do |l|
  l.store "Edit", "編集"
  l.store "%%a, %%d %%b %%Y %%H:%%M:%%S GMT", Proc.new { |date| sprintf(date.strftime("%Y-%m-%d %H:%M:%S GMT")) }
  l.store "Unclassified", "未分類"
  l.store "Just Presumed Ham", "承認と推定"
  l.store "Ham?", "承認?"
  l.store "Just Marked As Ham", "承認マーク"
  l.store "Spam?", "スパム?"
  l.store "Just Marked As Spam", "スパムマーク"
  l.store "yes", "はい"
  l.store "no", "いいえ"
  l.store "Drag some plugins here to fill your sidebar", "サイドバーで利用するプラグインをドラッグしてください"
  l.store "Active", "有効"
  l.store "Yes", "はい"
  l.store "is about to say", "〜について言う"
  l.store "Confirm Classification of Checked Items", "チェックした行の分類を認める"
  l.store "No", "いいえ"
  l.store "by", "by"
  l.store "no ", "no "
  l.store "on", "の"
end
