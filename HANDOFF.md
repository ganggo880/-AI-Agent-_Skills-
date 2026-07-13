# HANDOFF — 雙 AI 接力交班檯

> **每次工作前**先讀本檔最上面的「目前狀態」。**每次工作結束前**更新「目前狀態」與「下一步」。
> 寫的時候假設下一個接手者是陌生人。

---

## 目前狀態（最新）
- **更新時間**：2026-07-12（深夜）
- **最後操作者**：Claude Code（Fable 5）
- **進度**：**AI Agent 基本功 EP05（三層一次講清楚：技能/全域/專案）長片＋3 指定短片全流程交付完成** ✅
  - 來源：Downloads `AI Agent基本功 EP05_三層一次講清楚_搞定 技能_全域_專案.mp4`（61:46 / 2.1GB / 真 CFR）→ `raw/aiagent-ep05/`；smart-cut → 45:51（剪 25.8%）
  - 字幕：Groq 10872 字 → 修正版 resegment 998 段（**孤兒殘尾 0**，修復持續生效）→ 使用者授權清字全自動 → 156 段更正 → validate 通過 → 刪 1 抖內 → 最終 997 段 / 45:51
  - **本集詞彙更正重點**：Edge TTS 家族（HTTS/Agen DTS/HTS松任/STS，**先做保護避免被 Agent 規則掃到**）、Agent 家族超多變體（Aging/AGEN/A-GEN/Agin/Agen/AiGEN/A局/A群/Edging/ARH…）、agint.md→**AGENTS.md**、權域→全域、三層備員→備援、圖坑→Token、人民黨民→**人名檔名**（引用語音正規化規則的關鍵句）、Kamit加Push跟Pori→Commit加Push跟Pull、108克剛→108課綱、Gil repo→Skill repo、李俊尼Soyul→李俊儀SOIL、C-Dance→Seedance、Meta Bloodlib→Matplotlib、F5 MPEG→FFmpeg、三師爸的生意→聲音
  - 長片標題**沿用原始檔名**（使用者指示）：「AI Agent基本功 EP05_三層一次講清楚_搞定 技能_全域_專案」；橘色三層平台封面；5 檔
  - **短片 4 支**（①②③使用者指定主題、④追加「技能的定義」；標題我定，全自動，各 7 檔含直式 9x16）：
    ①「語音輸入有錯字不用改：AI 自動幫你正規化」(59s；00:24:23-00:25:20 連續段)
    ②「叫 AI 做完事用語音回答你，不用再盯螢幕」(57s；含 27:40 起的 TTS 原理語音展示段)
    ③「專案思維：一個 repo 讓任何 AI 重現台語教材工作流」(59s；38:07+39:05 兩段)
    ④「技能到底是什麼？一句話：一份使用說明書」(57s；09:45 定義＋12:11 通用格式＋14:32「你長出來的技能才是你的技能」金句收尾)
  - 注意：影片承諾 **Padlet 素材包**（安裝懶人包/連接指南/兩個全域設定福利/技能分享區）連結放說明欄，長片與短片①②都要補
- **前一筆（2026-07-12）**：從 OpenCode EP05 成品截 3:11–6:36 做**單一教學片段**「OpenCode 免費版安裝教學：從下載到開啟 Big Pickle」→ `output/…[Claude] (教學片段)/`（4 檔：乾淨 mp4／字幕燒錄版／srt／txt，3:26）
  - 切點對齊字幕邊界（00:03:11.300–00:06:36.820）；字幕重新清洗 13 段（舊版 resegment 的「OpenC/ode」斷頭、按消→按下、選擇過帳號→選 Google 帳號、T&Agent→體驗Agent、值得以用→值得使用等），時間碼未動、段數 88 不變，燒錄後抽幀驗證 OK
  - 註：EP05 主成品的 srt 未回改（僅此片段清洗）；若日後要重發 EP05 長片可比照更正
- **進度**：**ChatGPT APP 基本功 EP06（Codex 更名大改版）長片＋3 短片全流程交付完成；並修復 resegment.py「孤兒殘尾」bug** ✅
  - 🔧 **resegment.py 重大修復（全域＋專案已同步，日後所有影片受益）**：
    - 症狀：一句話最後 1–2 個字被截到下一段開頭（如「…需要的程」／「式,完全免費!」）
    - 成因：規則 2 盲信 Whisper segment 邊界（常落在句尾前 1–2 字）＋規則 5 硬切不前瞻
    - 修法：`punct_ahead()` 前瞻守衛（切前看 1–2 詞內有無標點，有就寬限）＋ `rescue_orphan_tails()` 最終救援（前段無標點收尾時，段首 ≤2 字＋標點殘尾整批搬回前段）＋ 發語詞白名單（好/嗯/欸…開頭不誤搬）
    - 實測：EP03 真孤兒 11→0、EP04 16→0、EP06 新片 0；發語詞段完好；SKILL.md 已補文件
    - ⚠️ 跨段替換小坑：清字時若替換詞跨段（如 XHigh），比例分配會把英文詞切成 XHig/h，需手動收回前段
  - 來源：`ChatGPT APP 基本功第六集...mp4`（38:30 / 1.3GB / 真 CFR 無黑幀）→ `raw/chatgpt-ep06/`；smart-cut → 22:43（剪 41%）
  - 字幕：Groq 5624 字 → 修正版 resegment 574 段（孤兒 0）→ STOP1 使用者確認 8 項（YL→SOL、Walk→Work、開到早→XHigh、3萬→100萬、龍蝦=遙控工具暱稱保留、Faili→Thinking、和平→權限、Claude GPT→Claude 跟 GPT）→ 67+ 段更正 → validate 通過 → 刪 1 抖內 → 最終 573 段 / 22:41
  - **本集詞彙更正重點**：ChatGPT APP 變體（ChartGPT/ChatsGPT/CLAGPT/CheckGPTAPP/ClaudeGPT APP/**LGBT應用程式**）、SOL 變體（SOUL/Sold/SORO/Zone）、Terra（ERA/5.6TB）、Luna、Opus 4.8（UP4.8）、Sonnet（Sone）、Netlify/Vercel/Google Sites、世足賽（四足賽）、姆巴佩（巴佩）、託管（脫光）、HTML簡報（HCM簡報）
  - 內容：Codex 正式更名 ChatGPT APP。三模型 SOL/Terra/Luna（太陽/地球/月球，對標 Opus/Sonnet/Haiku）、對話整合、**內建網站託管**（3D 賽車實演直接發布）、Remote Control 手機遙控、語音=GPT5.5 Thinking、內建生圖；SOL 需 $100 方案、額度重置有期限；講者評：目前第一名、付費首選
  - 長片標題使用者選 A1：「ChatGPT APP 基本功 EP06：全新改版大解析，教師教學神器一次看懂」；主色**藍色**（GPT 家族）；交付 5 檔
  - **短片 4 支**（使用者授權標題我定；第 4 支為使用者追加的 Remote Control 段）：A「Codex 沒了！改名 ChatGPT APP，我把第一名頒給它」(54s)／B「一句話生出 3D 賽車，直接發布上線給大家玩」(57s)／C「太陽、地球、月球：ChatGPT 三模型這樣選就對了」(46s)／D「用手機遙控電腦上的 ChatGPT APP，不用帶電腦也能做事」(51s)；各 7 檔（含直式 9x16）
  - 追加修正：Remote Control 段的「remove」誤聽 → **Remote**（3 處），working 與 output 長片 srt/txt 皆已同步修正
  - 注意：**頻道系列更名**「GPT Codex 基本功」→「ChatGPT APP 基本功」，上架時考慮新播放清單；長片說明欄放 3D 賽車 demo 網址
  - 📐 **工作流新規則（2026-07-11 使用者拍板，已寫入 skill）**：**每支短片必加產 9:16 直式版**（YouTube Shorts 發布用）
    - 新腳本 `skills/short-video-workflow/scripts/make_vertical.py`：模糊背景填充、內容不裁切、1080×1920、自動驗證解析度；輸入用已燒字幕版（字幕跟著前景走，不重燒）
    - 已更新：`short-video-workflow/SKILL.md`（規格表、Step 6-3、Step 8 檔名 `_直式9x16.mp4`、checklist 7 檔、踩坑）＋ Claude/Codex 兩份總控 SKILL.md 階段 2
    - EP06 三支短片已回填直式版（各 7 檔）；**更早的短片（EP03/EP04/台語短片）沒有直式版**，要發 Shorts 時可用同腳本補（Codex EP05 三支當時已手動做過直式）
- **前一支（2026-07-06）**：**AI Agent 基本功 EP04（連接外部工具／MCP 一張地圖）長片＋3 短片全流程交付完成** ✅
  - 來源：使用者 Downloads `AI Agent基本功_EP04...mp4`（原長 96:14 / 3.3GB；**VFR**）
  - ⚠️ **重大踩坑（已解，日後注意）**：smart_cut 的 VFR 防護對本片 `avg=519732000/17324401`≈30.0001 **漏判**，auto-editor 吃 VFR → cut 從約 5 分鐘後**全黑幀**（YAVG=0）。修法：手動 `ffmpeg -fps_mode cfr -r 30 -c:v libx264 -preset veryfast -crf 20 -c:a copy` 把原始轉真 CFR（avg=r=30/1）→ 再跑 smart_cut → 亮度全時段 >0。**已 flag 修 smart_cut 任務（task_f5316702）**。凡 VFR 影片剪完務必抽樣多點 YAVG 驗證！
  - smart-cut（CFR 版）→ 43:59（剪 54.3%）
  - 轉字幕：Groq 11035 字 → resegment 1124 段 → **本片使用者授權全自動（清字/標題/短片全我決定）** → 大小寫敏感+regex 腳本套 190 段更正 → validate 通過 → 刪 4 抖內 → 最終 1120 段 / 43:58
  - **本集詞彙更正重點**（超多，MCP/連接器主題）：
    - Padlet（Pelet/Pallet/Panlet/Pellet/Pedlet/Adlet）、**OAuth**（Auth/oast/Obs/AWS/All-search/OUS/GetOth，**regex `Obs(?!idian)` 保護 Obsidian**）、**Access Token**（AXS Token/Sex2K/Assess2Key/Assesspoken）、**CLI**（Cli/DLI/C-I）、**Wordwall**（WOW/WordWord/WorldWorld/渦污）、**Google Tasks**（Google Desk/GoDesk/Google Dex）、**Google Cloud Console**（Google Claude Console→Cloud）、Canva（Camba/CAMBA/CAMMA）、Classroom（Clusserun）、Firebase（Filebase）、Supabase（Super Base/SuperBass）、PowerShell（PowerShare）、JSON（Jason）、C槽（西朝）、行事曆（形式力）、非Google（FayGoogle）、Agent 家族、權限（全線）、免鑰匙（免要時）、伸出（增出）
  - 內容：Claude Code 示範連外部工具。兩問題（是否 Google／簡單 vs 完整控制）、四通道（內建連接器/MCP/CLI/直接操控）、權限低→高（免鑰匙→API Key/Access Token→OAuth）；實測 Wordwall/NotebookLM(MCP CLI)/Google Tasks(OAuth 經 Google Cloud Console 超麻煩)；手機 Remote Control 遙控電腦
  - 主色**橘色**（Claude Code）；長片標題我定：「AI Agent 基本功 EP04：連接外部工具，MCP 與連接器一張地圖講清楚」
  - 長片交付：`output/AI Agent 基本功 EP04：連接外部工具，MCP 與連接器一張地圖講清楚 [Claude]/`（5 檔；封面橘色 MCP 連接地圖）
  - **短片 3 支**（使用者授權我自訂標題）：①「別再一個一個學工具，AI 用自然語言全幫你控制」(44.6s) ②「MCP 是什麼？一個轉接頭比喻讓你秒懂」(29.5s) ③「用手機遙控電腦上的 Claude Code，走到哪交代到哪」(31s)；各 6 檔
  - 注意：長片承諾「連接指南 GitHub repo／Padlet」連結放說明欄，上架務必補
- **前一支（2026-07-05）**：**AI Agent 教學應用「予 AI 講台語」（免費開源台語教材產生器）長片＋1 精華短片全流程交付完成** ✅
  - 來源：使用者 Downloads `AI Agent教學應用_予 AI 講台語...mp4`（原長 18:27 / 642MB；**VFR** → smart_cut 自動轉 CFR）→ 歸檔 `raw/taigi-agent/`
  - smart-cut → 12:22（剪 32.9%）；亮度 ~200 無黑畫面
  - 轉字幕：Groq 2719 字 → resegment 280 段 → **本片使用者授權全自動（清字/標題/短片全我決定，一次做到好）** → 大小寫敏感腳本套 31 段更正 → validate 通過 → 刪 1 段抖內 → 最終 279 段 / 12:22
  - **本集詞彙更正重點**：AI-Aging/Aging/Agin/AIAgin/A群→**Agent/AI Agent**、**西朝→C 槽**、**異傳→意傳**（台語語音平台）、Open Code→OpenCode、GitHub report→repo、Claude Codes→Claude Code、台語「菜市仔」變體統一（蔡奇亞/菜奇亞/菜池仔/菜茄子→**菜市仔**）
    - 註：台語示範播放段（阿嬤/翻牌遊戲音）為 AI 生成台語音，Whisper 無法精準轉寫，保留近似（非主述旁白，影響小）
  - 內容：Claude Code 示範，把 GitHub repo 丟給 Agent 安裝 → 專案內對話生成台語講義/考卷/語音(意傳官方發音)/教學影片/網頁互動遊戲/PPT；完全免費、免 API Key。核心：用「一個專案資料夾」承接整套複雜工作流
  - 主色**橘色**（Claude Code 示範）；長片標題我定：「AI Agent 教學應用：予 AI 講台語，免費開源專案一鍵生成台語教材」
  - 長片交付：`output/AI Agent 教學應用：予 AI 講台語，免費開源專案一鍵生成台語教材 [Claude]/`（5 檔）
  - **短片只做 1 支**（使用者指定：講解專案能做什麼的最精華一支）：「予 AI 講台語，免費專案生成所有台語教材」（39.9s，6 檔；問題→能生成一切→完全免費→連結）
  - 注意：長片與短片都承諾「台語專案 GitHub repo」連結放說明欄，上架務必補
- **前一支（2026-07-04）**：**「教師的第二黑板：自媒體經營術」（三師爸自媒體經營直播）長片＋1 短片（含 16:9＋9:16）全流程交付完成** ✅
  - 來源：使用者 Downloads `教師的第二黑板-自媒體經營術.mp4`（原長 75:37 / 240MB；**CFR** 30/1、720p，免轉檔）→ 歸檔 `raw/teacher-media/`
  - smart-cut（threshold 0.06、margin `0sec,0.1sec`，輸出 C:\temp 再搬回）→ 51:34（剪 31.8%）；亮度抽樣 164–217 無黑畫面
  - 轉字幕：Groq 13250 詞 → resegment 1341 段 → apply_vocab → **STOP1 使用者確認人名**（通閒/崇尚/充賢→**聰賢老師**、海西/凱希→**凱西**、連魚人/連連任長→連育仁、王岐霖→王齊麟、Jomein→Joeman、愛麗莎莎→愛莉莎莎）→ finalize 套 66 段更正 → validate 通過（1341 段全吻合、51:13）→ 未刪段（Padlet 互動段依使用者保留）
  - **本集詞彙更正重點**（自媒體/教學直播系列可沿用）：日媒體/直媒體/進一字媒體→**自媒體**、教師演習→**教師研習**、後色認知→**後設認知**、平留時間→**停留時間**、出訴/初速→**出書**、廣告分論/分額→**廣告分潤**、腰月延期→**邀約演講**、天文→**貼文**、低促進→**低觸及**、三八人/sumbody→**somebody**、反播性→傳播性、同音程→**同溫層**、寡大→廣大、四文化→次文化、配列→**Padlet**、確訊據查→搜尋、破片→選擇、暈得上→跟得上
  - 長片標題**Claude 自行拍板**（使用者授權「標題由你決定」）：「認真老師的第二黑板：把影響力放大 10 倍的自媒體經營術」
  - 長片交付：`output/認真老師的第二黑板 把影響力放大 10 倍的自媒體經營術 [Claude]/`（5 檔；封面**橘色**、綠色黑板＋成長箭頭＋社群圖示）
  - **短片使用者最後決定只做 1 支**（原本規劃 A/B/C 三支，STOP2 後使用者選「只做 C」）：
    - C 工具型「5 天 vs 2 小時：AI 怎麼幫老師剪教學影片」（36.64s：33.6s 內容＋3s 字卡）
    - 時間碼：`00:12:14.300-00:12:47.900`（連續段，切點乾淨）
    - 交付：`output/5 天 vs 2 小時 AI 怎麼幫老師剪教學影片 [Claude] (Short)/`（**7 檔**：乾淨16:9／字幕16:9／**直式9x16 1080×1920**／srt／txt／cover／metadata）
  - **⚠️ 本機 ffmpeg 環境踩坑（新，日後沿用解法）**：
    - `ffmpeg 8.1.2 (gyan.dev)` 的 **drawtext 會直接 segfault**（`Fontconfig error: Cannot load default config file`）→ 結尾字卡改用 **PIL 畫 PNG**（`skills` 未動，臨時腳本）再轉影片
    - **libass 燒字幕也需 fontconfig** → 建一份 `fonts.conf`（`<dir>C:\Windows\Fonts</dir>`）並 `export FONTCONFIG_FILE=...` 才能燒中文字幕（`subtitles=...:force_style='FontName=Microsoft JhengHei'`）
    - `-loop 1 -i xxx.png` 會 **parser buffer 溢位**（Failed to reallocate parser buffer to 負值）→ 改用 `-i png` + `loop=loop=-1:size=1,fps=30,trim=duration=3` filter 生成靜態卡影片
    - Git-Bash 跑含 filter 的 ffmpeg 要 `export MSYS_NO_PATHCONV=1 MSYS2_ARG_CONV_EXCL='*'`，否則 filter 裡的 `:`／`/path` 被 MSYS 轉義
    - **`add_end_card.py` 在此環境失效**（drawtext + 硬寫 1920×1080 與 720p 不符）；本次手工繞過。日後若要修 skill：改字卡尺寸吃來源解析度、drawtext 換 PIL 或修 fontconfig
- **前一支（2026-07-03）**：**GPT Codex 基本功 EP05（Codex 超好用五功能）長片＋3 短片（各含 16:9＋9:16）全流程交付完成** ✅
  - 來源：使用者 Downloads `GPT Codex 基本功EP05...mp4`（原長 29:40 / 1GB；**VFR！** avg≠r_frame_rate → smart_cut 自動轉 CFR）→ 歸檔 `raw/codex-ep05/`
  - smart-cut（threshold 0.06、margin `0sec,0.1sec`，輸出 C:\temp 再搬回）→ 16:02（剪 45.9%）；亮度抽樣 ~200 無黑畫面（VFR 轉檔成功）
  - 轉字幕：Groq 4176 字 → resegment 422 段 → apply_vocab → **本集使用者授權我自行確認清字（跳過 STOP1）** → 大小寫敏感腳本套 25 段更正 → validate 通過（422 段）→ 無抖內段
  - **本集詞彙更正重點**（Codex 系列沿用）：Versale→**Vercel**、Netify→**Netlify**、Coldex/Podex→**Codex**、AIA菌→**AI Agent**、Compute Use→**Computer Use**、Agent.md→**AGENTS.md**、All Decks→**Codex**（首選推薦）、Edge/agent→Agent、資料獎→資料夾
  - 長片標題**我自行選定**（使用者授權）：「GPT Codex 基本功 EP05：Codex 超好用的五個隱藏功能」
  - 長片交付：`output/GPT Codex 基本功 EP05：Codex 超好用的五個隱藏功能 [Claude]/`（5 檔；封面**藍色**Codex 主題、CLI 視窗大「5」+五功能圖示）
  - **短片 3 支全做**（使用者要全做＋自選主題）——**新增求：每支多產一支 9:16 直式版**：
    - 目標模式「設好目標，Codex 自動做到完才停」（43.3s）
    - 語音輸入「Codex 內建語音輸入，免費又準取代付費工具」（40.3s）
    - Computer Use「讓 Codex 接管瀏覽器，複雜網站自動幫你操作」（44.9s）
    - 交付：`output/<各短片標題> [Claude] (Short)/`（各 **7 檔**：乾淨 16:9／字幕版 16:9／**直式9x16 1080×1920**／srt／txt／cover／metadata）
  - **9:16 直式做法（新，日後沿用）**：clip_cut 不支援 aspect；用 ffmpeg 把字幕版 16:9 轉直式——`split` 複製一路 `scale=1080:1920:increase,crop,gblur=sigma=25` 當模糊背景，另一路 `scale=1080:-2` 前景置中 overlay。內容不裁切（螢幕示範不能裁 UI），字幕沿用 16:9 燒錄版
- **前一支（2026-06-29）**：**AI Agent 基本功 EP03（Agent 的四隻手腳：讀檔/寫程式/上網/出成品）長片＋3 短片全流程交付完成** ✅
  - 來源：使用者 Downloads `AI Agent 基本功 EP03...mp4`（原長 75:10 / 2.6GB；**CFR** 30/1，免轉檔）→ 歸檔 `raw/aiagent-ep03/`
  - smart-cut（threshold 0.06、margin `0sec,0.1sec`，**輸出 C:\temp 再搬回**）→ 48:35（剪 35.4%）；亮度抽樣 ~200/255 無黑畫面
  - 轉字幕：Groq 12615 字 → resegment 1215 段 → apply_vocab → STOP1 使用者確認 8 處 → 自寫大小寫敏感+跨段替換腳本套 115 段更正 → validate 通過（1215 段全吻合）→ 刪 4 段抖內 → 最終 1211 段 / 48:34
  - **本集詞彙更正重點**（AI Agent 系列沿用）：
    - Agent 家族：AiGeng/Aging/Edging/Edge/Agin/Agen/AGE/A群/AI局/AI群/AIA/AIG → **Agent / AI Agent**（**大小寫敏感**避免誤傷既有 Agent；Agen 用負向預看 `(?!t)`）
    - **Chrome vs Claude**：段 360/370/376/377「Claude 線上程式應用商店 / Claude 瀏覽器」→ **Chrome**（該段在裝 Claude in Chrome 擴充，商店與瀏覽器是 Chrome）
    - 工具/套件：Quizzer→Whisper、Tibeless/TypeList/Tabless→**Typeless**、MarkDone→**MarkItDown**、MetaPlanetLive→**Matplotlib**、PlayWrite→**Playwright**、BigPicco→**Big Pickle**、大煙菜→大醃菜
    - 模型：Opus.8→**Opus 4.8**、GLM5.2→**GLM 5.2**；**GPT5.5 保留原文**（使用者拍板）
    - 用語：複製入鏡→**複製路徑**、未給(檔案)→**餵給**；抖內/喊名段全刪（818/847/956/957）
  - 長片標題使用者選 A3：「AI Agent 基本功 EP03：一句話讓 AI 幫你讀檔、寫程式、上網、做出成品」
  - 長片交付：`output/AI Agent 基本功 EP03：一句話讓 AI 幫你讀檔、寫程式、上網、做出成品 [Claude]/`（5 檔齊全；封面橘色、AI 機器人四隻手臂＝檔案/終端機/網路/PowerPoint）
  - **短片一次交付 3 支** ✅（使用者指定 B6/D9/D10 主題，由我自選段落組順敘三幕；clip_cut 會自動按時間排序，故 hook 都選在時間軸最前段）：
    - B6「凌亂的下載資料夾，一句話讓 AI 幫你整理乾淨」（55.5s）：痛點資料夾沒空整理 → AI 一句話分類 → 整整齊齊＋待刪確認
    - D9「一句話，AI 上網抓會考題自動做成 PowerPoint 考卷」（62.7s）：一句話下載會考題 → 每題截圖排 PowerPoint＋自動解答 → 一次做完幫老師省勞務
    - D10「一份免費清單，讓 AI 變身老師的文書神器」（47.6s）：老師 Python 工具清單 → 丟 .md 給 Agent 全自動裝好 → GitHub repo 放說明欄
    - 交付：`output/<各短片標題> [Claude] (Short)/`（各 6 檔齊全；封面橘色＋SHORT 標識）
  - 注意：影片承諾「老師 Python 工具清單 GitHub repo」與「Big Pickle＝OpenCode EP05」連結放說明欄，上架務必補（D10 短片亦承諾工具清單 repo 連結）
- **前一支（2026-06-28）**：**OpenCode EP05（免費 Big Pickle 與最強 GLM 5.2）長片＋2 支短片全流程交付完成** ✅
  - 來源：`raw/opencode-ep05/opencode-ep05.mp4`（原長 56:22 / 1.83GB；**CFR** 30fps，免轉檔）
  - smart-cut（threshold 0.06、margin `0sec,0.1sec`，**輸出 C:\temp 再搬回**）→ 33:25（剪 40.7%）
  - 轉字幕：Groq 8046 字 → resegment 825 段 → apply_vocab → STOP1 使用者確認 6 處 → 套全部更正 → validate 通過（825 段全吻合，本集無整段刪除，喊名段以「保留工具名」方式編輯）
  - **本集詞彙更正重點**（OpenCode 模型系列可沿用）：
    - 免費模型：`Big Pico/BigPico/Pico/BigCode/BigPo` → **Big Pickle**；pickle 哏 `煙黃瓜/煙菜` → 醃黃瓜/醃菜（使用者拍板）
    - `GLM5.2/ULM2/Gm5.2` → **GLM 5.2**；`OpenLauter` → OpenRouter；`OpenGo` → OpenCode Go 方案
    - `Tragibility Code` → **ChatGPT Codex**（使用者確認）；`Deepstick/Disk V4` → DeepSeek V4；`seal大加/Gill` → SOIL Teaching Deck
    - 抖內名刪除但**保留工具名**：`Claude Flare的Walker AI` 其實是 **Cloudflare 的 Workers AI**（已修正）、Z-Image Turbo 保留
    - 補修：段 50「Claude B」→「Big Pickle」（剪短片時發現，長片字幕已同步）
  - 長片標題使用者選 #4：「OpenCode 基本功 EP05：免費 Big Pickle 與最強 GLM 5.2」
  - 長片交付：`output/OpenCode 基本功 EP05：免費 Big Pickle 與最強 GLM 5.2 [Claude]/`（5 檔齊全；封面橘色、左免費醃黃瓜 Big Pickle vs 右皇冠 GLM 5.2）
  - **短片 2 支**（使用者指定主題、由我自選段落拼成完整敘事）：
    - 「學 AI Agent 的最佳免費 Plan B：Big Pickle」（81.3s）：研習痛點 → Plan B＝Big Pickle → 實測能打
    - 「AI 自己寫技能：免費生圖＋自動疊中文字」（89.3s）：OpenCode 沒生圖 → GLM 5.2 寫 Draw Free 技能 → 生圖＋疊字 → 打包 repo
    - 交付：`output/<各短片標題> [Claude] (Short)/`（各 6 檔齊全）
  - 注意：影片中承諾 **Draw Free 技能 GitHub repo 連結與 OpenCode Go 推薦碼** 放說明欄，上架務必補上
- **前一支**：**AI Agent 基本功 EP02（核心觀念與初始化設定）長片＋3 支短片全流程交付完成** ✅
  - 來源：**YouTube 直播下載**（`https://youtube.com/live/gm1ln1Z0hHo`）→ yt-dlp 1080p → `raw/aiagent-ep02/`（原長 78:58 / 435MB；**CFR** 30fps，免轉檔）
  - **下載坑**：長時間下載先存 `C:\temp` 再搬進 raw，避免 GDrive 同步抓到半成品
  - smart-cut（threshold 0.06、margin `0sec,0.1sec`，**輸出 C:\temp 再搬回**）→ 52:36（剪 33.4%）。剪輯版有深色投影片（如「四大 Agent 全域設定對照」），抽樣偏暗屬正常非黑畫面
  - 轉字幕：Groq 13495 字 → resegment 1328 段 → apply_vocab → STOP1 使用者確認 5 處 → 套全部更正 → validate 通過（1328 段全吻合）→ 刪 8 段抖內/喊名 → 最終 1320 段
  - **本集詞彙更正重點**（觀念課術語多）：
    - `AI Aging/Aging/AIA群/A群/A局` → Agent；`痊癒/權域/權育` → 全域；`全線(指權限)` → 權限；`Edge/Edging` → Agent
    - `Tucan/團/圖/肯` → Token；`Compat` → Compact；`GitInitial` → git init；`GitEgnome/Ignome` → .gitignore；`專案出什麼` → 專案初始化
    - 模型名：`Obs/OPPS` → Opus、`FAPO5` → Fable 5、`Soulnet` → Sonnet、`Dipseek` → DeepSeek、`Artracode` → Ultra（版號保留原文）
    - **踩坑（新）→ 已解決（2026-06-22）**：resegment 會把詞切在兩段邊界（如「痊癒」被切成段尾「痊」+段首「癒」），舊版逐段 replace 抓不到。`apply_vocab.py` 與 `finalize_subtitles.py` 已改為跨段替換引擎（詳見下方 §「跨段詞彙替換」）
  - 長片標題使用者選 #4：「AI Agent 基本功 EP02：學習 Agent 必懂的核心觀念與初始化設定」
  - 長片交付：`output/AI Agent 基本功 EP02：學習 Agent 必懂的核心觀念與初始化設定 [Claude]/`（5 檔齊全；封面橘色、AI 核心＋五觀念節點）
  - **短片一次交付 3 支** ✅（使用者要 A/B/C 三版都做）：
    - A 痛點型「AI 越用越笨、用量還爆掉？關鍵是上下文」（50.6s）
    - B 觀念型「全域放我是誰，專案放我要做什麼」（43.9s）
    - C 知識型「AI 模型分三級，這樣選又聰明又省錢」（30.4s）
    - 交付：`output/<各短片標題> [Claude] (Short)/`（各 6 檔齊全）
  - 注意：影片多次提到「延續 EP01」，上架說明欄放 EP01 連結
- **前一支**：**AntiGravity EP08（Agent 代理・複製你的聲音／VoxCPM2）長片＋3 支短片全流程交付完成** ✅
  - 來源：`raw/antigravity-ep08/antigravity-ep08.mp4`（原長 67:58 / 2.2GB；**本片是 CFR**，r=avg=30/1，免轉檔）
  - smart-cut（threshold 0.06、margin `0sec,0.1sec`，**輸出到 C:\temp 再搬回**避開 GDrive 脫水）→ 42:12（剪 37.9%）
  - 轉字幕：Groq 10988 字 → resegment 1084 段 → apply_vocab → STOP1 使用者確認 8 處 → 套全部更正 → validate 硬關卡通過（1084 段全吻合）→ 刪 16 段（4 段 CMNNN 亂碼＋12 段抖內/喊名）→ 最終 1068 段
  - **本集詞彙更正重點**（語音克隆系列可沿用）：
    - 工具名：`VOXCPM2/Vox CP2/Vox CPM2/VoXcp/VoS CPM2` → **VoxCPM2**；`HyperFran/Hyperplane/Hyper Flame` → **HyperFrame**（使用者拍板）
    - `Edge/Edging` → Agent；`STT/RTS/PTS/SET` → **TTS**；`Test to Sum` → Text to Speech；`Engine`（指另一代理）→ Agent
    - 使用者拍板：`名語`→閩南語、`348`→三師爸、3D加速卡**保留**；刪除一段 CMNNN 亂碼；抖內/喊名段全刪
  - 長片標題：**依檔名** →「AntiGravity 基本功 EP08：Agent 代理，複製你的聲音」
  - 長片交付：`output/AntiGravity 基本功 EP08：Agent 代理，複製你的聲音 [Claude]/`（5 檔齊全；封面橘色、麥克風＋聲波＋AI 機器人＋FREE）
  - **短片一次交付 3 支** ✅（使用者要 A/B/C 三版都做）：
    - A 痛點型「別再付費買 AI 語音了」（65.5s）：00:00:09-13.6 hook → 00:00:21.1-46.5 開源免費 → 00:07:22.1-54.5 能力總結
    - B 好奇型「老師的聲音，讓 AI 幫你配教學影片」（57.8s）：複製超像 → 可複製/創造 → 老師聲音做教學影片
    - C 警示型「你的聲音 30 秒就能被複製」（57.3s）：能複製任何人聲音 → 教學應用 → 防詐 AI 素養
    - 交付：`output/<各短片標題> [Claude] (Short)/`（各 6 檔齊全；C 版封面帶警示紅）
  - **第 4 支短片（趣味亮點）也已交付** ✅（使用者指定擷取小克×三師爸對談段）：
    - 標題：「AI 自動生成雙人對話，連貓咪聲音都有」（39.5s）
    - 組合：00:37:48.2-54.3 下指令開場 ＋ 00:41:11.9-42.3 黑貓小克×三師爸 AI 對談本體
    - 交付：`output/AI 自動生成雙人對話，連貓咪聲音都有 [Claude] (Short)/`（6 檔齊全；封面可愛黑貓＋雙聲波）
  - 注意：影片中多次承諾「VoxCPM2 的 GitHub repo 連結放說明欄」，上架務必補上
- **前一支**：**AI Agent 基本功 EP01（用 Agent 學 Agent）長片＋短片全流程交付完成** ✅
  - 來源：`raw/aiagent-ep01/aiagent-ep01.mp4`（原長 75:20 / 2.44GB，來自使用者 Downloads；**VFR**）
  - **預防 VFR 黑畫面**：剪前先 ffprobe 確認 avg_frame_rate 非整數比 → 先轉 CFR（`-fps_mode cfr -r 30 -crf 18 -c:a copy`）再剪，全程驗證亮度正常
  - **GDrive 寫入坑（新）**：auto-editor 直接輸出到 GDrive 路徑時，檔案會在 smart_cut 報 OK 後消失（疑似 GDrive 同步脫水）。解法：輸出到本機 `C:\temp\`，再 `cp` 搬回專案。建議日後長片 smart-cut 一律輸出本機再搬回。
  - smart-cut（threshold 0.06、margin `0sec,0.1sec`）→ 48:48（剪 35.2%）
  - 轉字幕：Groq 11992 字 → resegment 1154 段 → apply_vocab → STOP1 使用者確認 8 處 → 套全部更正 → validate 硬關卡通過（1154 段全吻合）→ 刪 11 段抖內/喊名段重編號 → 最終 1143 段
  - **本集詞彙更正重點**（AI Agent 系列日後可沿用）：
    - Agent 家族：`A-GEN/Agin/Aging/AI Aging/AIH/AIA群/A群/agy/AIGEN` → **Agent / AI Agent**
    - 生成式：`生程式/真程式/真誠式/聖誠士/聖德斯/深層式/生存式/Sense4/CN4` → **生成式**
    - `Antigravity/Antigrity/Ntegraf2/MTGRAVIT2/agy/HGY` → **AntiGravity**；`Podex`→Codex、`Deepthic`→DeepSeek
    - 使用者拍板：GPT5.5/Gemini3.5/Fable **保留原文**；`充WL的服務員員`→充值；`破搓`→裹足不前；**抖內/觀眾名段落全刪**
  - 長片標題使用者選 #10：「一個 GitHub repo，複製我的整套 AI 工作流到你的 Agent」
  - 長片交付：`output/一個 GitHub repo，複製我的整套 AI 工作流到你的 Agent [Claude]/`（5 檔齊全；封面橘色、GitHub repo 複製 Agent 大軍主視覺）
  - **短片也已交付** ✅（A 痛點型，67.5s＋3s 字卡＝70.5s）：
    - 標題：「AI Agent 就是你的第二大腦」
    - 精華組合（3 段）：00:13:27.9-00:14:04.9 切換工具痛點 → 00:14:40.9-00:15:00.8 Agent 解放勞務 → 00:16:17.3-00:16:27.7 第二大腦收尾
    - 交付：`output/AI Agent 就是你的第二大腦 [Claude] (Short)/`（6 檔齊全）
  - **短片 C 版也已加剪交付** ✅（C 承諾型，49.9s＋3s 字卡＝52.9s，<60s 進 Shorts feed）：
    - 標題使用者選：「AI 時代，工作流可以一鍵複製給別人的 Agent」
    - 精華組合（3 段）：00:46:35.5-00:46:51.5 一個 repo＝複製一整個部隊 → 00:46:54.1-00:47:09.2 丟網址全自動跑一遍 → 00:47:16.2-00:47:34.8 複製任何人工作流、寫給 Agent 看
    - 交付：`output/AI 時代，工作流可以一鍵複製給別人的 Agent [Claude] (Short)/`（6 檔齊全；封面橘色、GitHub 一鍵複製 Agent 大軍）
  - 注意：影片中承諾「用 Agent 學 Agent 知識庫 repo 連結放說明欄」，上架時務必補上
- **前一支**：**AntiGravity EP07（Padlet MCP）長片＋短片全流程交付完成** ✅
  - 來源：`raw/antigravity-ep07/antigravity-ep07.mp4`（原長 48:18 / 1.56GB，來自使用者 Downloads）
  - smart-cut（threshold 0.06、margin `0sec,0.1sec`）→ 28:44（剪 40.5%）
  - 轉字幕：Groq 7288 字 → resegment 741 段（平均 2.33s）→ apply_vocab → STOP1 使用者確認 8 處疑慮 → finalize 套 155 段修正 → validate 硬關卡通過（741 段全吻合）→ 依使用者指示刪除段 740（觀眾暱稱）重編號 → 最終 740 段 / 10925 字
  - **本集詞彙更正重點**（Padlet 系列日後可沿用）：
    - `Pellet/Pallet/Paylet/Pelet/Petlet/Headlet/Panelad/Pairline/Panelette/Panet/配列` → **Padlet**
    - `Agin/A群/AIA群/A集員/Edging/AI Aging/AIAG/AIG/AGE` → **Agent / AI Agent**
    - 使用者拍板：`RuneIt`→ZoomIt、`提消`→提交、`先路`→嵌入、`未教育真人`→為教育增能、`資源供應`→支援供應、`圈的留言`→全部的留言
  - 長片標題使用者選 #9：「一句話生成 Padlet 課程牆：分區、投票、AI 插圖全自動完成」
  - 長片交付：`output/一句話生成 Padlet 課程牆_分區、投票、AI 插圖全自動完成 [Claude]/`（5 檔齊全；封面橘色主題、Padlet 牆主視覺）
  - **短片也已交付** ✅（A 痛點型，105.9s＋3s 字卡＝108.9s）：
    - 標題：「一句話，AI 幫你開好整面 Padlet」
    - 精華組合（4 段，對齊字幕邊界）：00:10:12.5-00:10:56.7 手動建牆痛點→Agent 開好 → 00:11:28.1-00:11:44.0 自動分區 → 00:12:19.8-00:12:40.4 投票實證 → 00:18:44.1-00:19:09.4 無限電子佈告欄金句
    - 交付：`output/一句話，AI 幫你開好整面 Padlet [Claude] (Short)/`（6 檔：乾淨版 mp4／字幕版 mp4／srt／txt／cover／metadata）
  - 注意：影片中多次承諾「repo 連結放說明欄」，**上架時務必放 Padlet MCP 的 GitHub repo 連結**（metadata checklist 已標註）
  - **黑畫面事故與修復（2026-06-12）**：第一版 cut.mp4 從 2:37 起全黑（僅有聲音）。原因：原始螢幕錄影是 **VFR（可變幀率）**，auto-editor 重編碼中途輸出黑幀。修復：先 `ffmpeg -fps_mode cfr -r 30 -c:v libx264 -crf 18 -c:a copy` 轉 CFR，再重跑 auto-editor——因音訊未動，新剪輯版時長與舊版毫秒級一致（1724.466s），字幕無需重做。長片與短片交付檔皆已用修復版覆蓋並逐點驗證亮度。
- **之前進度**：OpenCode EP04 長片＋短片交付（2026-06-08，詳見交班歷史）。
  - 影片：`Open Code 基本功EP04_ 免費 Agent組裝你的 Agent 大軍_無限解放token.mp4`（原長 93:54 / 3.27GB）
  - smart-cut（threshold 0.06、margin `0sec,0.1sec`）→ 52:43（剪 43.9%，這位口播者較連續、剪除率比實演片低屬正常）
  - 轉字幕：Groq 13947 字 → resegment 1387 段（平均 2.28s，防斷字 OK）→ apply_vocab → STOP1 疑慮確認 → 23 段套用更正
  - **本集詞彙更正重點**（之後若再剪三師爸 OpenCode 系列可沿用）：
    - 模型名統一：`Gemma412B` / `Gemma 412B` → **Gemma 4 12B**（使用者確認）
    - `CLA` → **CLI**；`Claude Go`→Claude Code；`Opensure`→OpenCode
  - validate 時間碼硬關卡通過（1387 段全吻合）
  - 標題候選 10 個 → 使用者選 **#3**「OpenCode 基本功 EP04：免費組裝你的 Agent 大軍，無限解放 Token」
  - 封面（gpt-image-2 low、橘色 Claude 主題、指揮官+士兵大軍構圖）+ metadata.md（兩套合併規格）全部產出
  - 交付路徑：`output/OpenCode 基本功 EP04_免費組裝你的 Agent 大軍，無限解放 Token [Claude]/`（5 檔齊全）
- **這次用的是擴充後總控**：`claude-youtube-video-workflow` 已縫入 3 個 STOP 關卡 + 時間碼硬關卡 + marketing-spec.md；本支即按新流程跑完。
- **之前進度**：Antigravity(Codex) 封裝 `video-editing-and-subtitles` 技能；EP05/EP06 短長片交付（詳見下方歷史）。

- **短片也已交付** ✅（B 好奇型，93s）：
  - 標題：「聰明人都這樣用 AI：軍師指揮、大軍出工」
  - 精華組合（4 段）：00:26:05-13 派工概念 hook → 00:27:52-00:28:23 軍師/士兵分工 → 00:45:28-50 Token 經濟學 → 00:47:49-00:48:17 收尾 CTA
  - 交付路徑：`output/聰明人都這樣用 AI_軍師指揮、大軍出工 [Claude] (Short)/`（6 檔：乾淨版 mp4／字幕版 mp4／srt／txt／cover／metadata）
  - 修正：結尾「AA君大君」→「AI 大軍」（長片字幕也一併修正回寫）；段 158「Gemma 4設備」→「Gemma 4 12B」

## 下一步（給下一個 AI）
- 「教師的第二黑板：自媒體經營術」長片＋C 短片（含直式）**皆已交付**，等待使用者下一步指令。
- 長片章節時間碼為建議值（metadata.md §5），上傳後請對照成片微調。
- **短片留言區務必置頂長片連結**（短片承諾「完整版看留言」，且結尾字卡寫「詳細影片請看留言」）。
- 若日後要補做原規劃的 A（沒有奇蹟只有累積）、B（somebody vs nobody）兩支短片，時間碼已在 `working/teacher-media/shorts-candidates.md`。
- **ffmpeg 環境問題見上方「本機 ffmpeg 環境踩坑」**——下次剪短片直接沿用（PIL 字卡 + fonts.conf + loop filter + MSYS_NO_PATHCONV）。
- 原直播為「不回放」，本剪輯版為正式上架版（片中三師爸多次提醒）。

---

## 上一次狀態（2026-05-10 上午）
- **最後操作者**：Claude Code（Opus 4.7）
- **進度**：第一支影片完成全流程
  - 影片：`你還在手動填課程計畫嗎 AI Agent 教師工作流實演`
  - 原始 14:00 → smart-cut（threshold 0.06、margin 0/0.1s）→ 1:42
  - audio-to-srt 完成清字（37 段、530 字）
  - 標題候選 10 個 → 使用者選 #7
  - 封面（gpt-image-2 low）+ metadata.md 全部產出
  - 全部素材在 `output/你還在手動填課程計畫嗎 AI Agent 教師工作流實演 [Claude]/`
- **環境驗證紀錄**：
  - ffmpeg ✅、Groq Key（`~/.groq_api_key`）✅
  - OpenAI Key 存放於 `~/.openai.env`，呼叫前用 `export $(cat ~/.openai.env | xargs)` 載入
  - auto-editor CLI 不在 PATH，smart_cut.py 已自動 fallback 到 `python -m auto_editor`
- **Codex 複測紀錄（2026-05-10）**：
  - ffmpeg ✅、Groq Key 檔 ✅、OpenAI env 檔 ✅、`scripts/sync-skills.ps1` dry-run ✅
  - Codex 目前使用 `C:\Python314\python.exe`；已安裝 `auto-editor 29.3.1` 到使用者 Python 套件目錄，`python -m auto_editor` ✅
  - smart-cut ✅（測試輸出：`working/codex-flow-test/sample.cut.mp4`）
  - 字幕後處理本機鏈路 ✅：抽音訊、resegment、apply_vocab、validate_srt、srt_to_txt
  - 已完成 Codex 版標題 #3：「老師必看：用 AI Agent 自動填好年度課程計畫」
  - Codex 版完整輸出在 `output/老師必看 AI Agent 自動填好年度課程計畫 [Codex]/`，含影片、SRT、txt、metadata.md、內建 Image2 產出的亮藍 Codex 版 `cover.png`
  - 封面已重新生成，要求人物重新參考 `assets/persona/三師爸人物形象照.png`；目前內建 Image2 若無 reference image 欄位，只能用 prompt 約束人物特徵，若臉不像本人需改用支援圖片參考/編輯的流程
  - 總控 Skill 已拆分：Codex 用 `skills/codex-youtube-video-workflow/`，Claude Code 用 `skills/claude-youtube-video-workflow/`；備份在 `skills-backup/`
  - 測試產物在 `working/codex-flow-test/`（被 `.gitignore` 忽略）

## 2026-05-11 短片三版實測（livestream-skills-pack）
- 來源直播：`raw/使用 AI Agent 來自動剪輯教學影片_Skills 技能懶人包福利大放送_.mp4`（3.3GB / 1h41m）
- 走「最短路徑」：跳過 smart-cut、跳過逐段清字（直播太長、短片用不到）
- ffmpeg 抽 16kHz mono 32kbps 音訊 24MB → 剛好擠進 Groq 25MB 上限
- Groq 轉錄：1937 段 / 17556 字
- 三個短片版本全成品（每版 5 檔齊全：mp4/srt/txt/cover.png/metadata.md）：
  - `output/沒有人比這個更簡單 AI Agent 自動剪片 [Claude] (Short)/`（A 痛點型，1:50）
  - `output/別再寫剪片程式 AI Skill 一鍵搞定 [Claude] (Short)/`（B 反直覺型，1:40）
  - `output/3 個秘訣 AI Agent 自動剪好教學影片 [Claude] (Short)/`（C 教學型，1:49）
- 封面均 Claude 橘色主題、SHORT 角標、人物樣貌延續基準照
- 中途事件：人物基準照因 git 歷史清理被連帶清掉本機，使用者從 `C:/2025三師爸/viewsonic專業形像照/` 重新放回；該檔已 .gitignore，本機需保留

## 跨段詞彙替換（2026-06-22 新增，Claude / Codex 共用）
- **問題**：字幕清字（`apply_vocab.py`、`finalize_subtitles.py`）原本逐段 `text.replace`，當一個詞被 resegment 切在相鄰兩段邊界時抓不到（實例：aiagent-ep02「痊癒」被切成段 315 尾「痊」+段 316 首「癒」，`痊癒→全域` 失效）。
- **解法**：兩支腳本都改用「虛擬接合」引擎——把所有段落文字接成一條長字串、記錄每個字屬於哪一段（owner 陣列），在長字串上偵測替換；命中跨段詞時把替換結果**按原長度比例就近分配**回原段落。
- **保證**：段數不變、時間碼不變、段號不變 → `validate_srt.py` 仍通過。分配時 `new 字數 ≥ 跨越段數` 時保證每段至少 1 字，不會清空段落。
- **行為相容**：段內命中的替換行為與舊版完全一致；`finalize_subtitles.py` 的段號專屬規則（如 `390:AGE->Agent`）仍只作用單段。
- **新增規則**：`apply_vocab.py` 已內建 `痊癒→全域`（已知 ASR 誤聽）。
- **測試**：`python skills/audio-to-srt/scripts/test_cross_segment.py`（10 案例全過，含中/英跨段、CRLF、段號規則不外溢，每案實跑 validate_srt）。
- **注意**：改的是 `skills/*/scripts/*.py`，**不是** SKILL.md，所以不會被 `sync-skills.ps1` 覆蓋。

## 已知議題 / 待解問題
- **VFR 原始檔會讓 auto-editor 輸出黑幀**（EP07 實際踩到：2:37 後全黑、僅剩聲音）。預防：smart-cut 前先 `ffprobe` 看 `avg_frame_rate` 是否為非整數比（如 `260793000/8693101`），是 VFR 就先轉 CFR（`ffmpeg -fps_mode cfr -r 30 -c:v libx264 -crf 18 -c:a copy`）再剪；音訊 copy 不動，剪輯點與時間軸不變。**已修復（2026-06-12）**：`smart_cut.py` 現會自動偵測 VFR 並先轉 CFR 暫存檔再剪、完成後刪暫存檔；SKILL.md 踩坑段亦已補充。
- 封面 png 是 1536x1024（3:2），YouTube 建議 1280x720（16:9）— 視覺上沒太大差，需要的話可以後處理裁切
- smart-cut 預設 threshold 0.04 對這位口播者太鬆，這支影片用 0.06 才剛好。下一支可以先試 0.05 找平衡。
- `auto-editor.exe` 安裝在 `C:\Users\mathr\AppData\Roaming\Python\Python314\Scripts`，該路徑不在 PATH；但 `smart_cut.py` 會走 `python -m auto_editor`，所以不影響 Codex 執行。
- `resegment.py` 不會自動建立輸出資料夾；新影片流程要先建立 `_subtitles/`，否則會 `FileNotFoundError`。
- PowerShell 操作含空白或 `[Claude]` / `[Codex]` 的路徑時要加引號；含中括號路徑建議用 `-LiteralPath`。
- `clip_cut.py` 會把 `--segments` 自動依時間排序（避免重疊偵測），所以**無法做倒敘剪輯**。版本 B 原想先放結論再回開場，被排序成順敘，效果略弱於設計。下次要做倒敘需加 `--keep-order` 選項並改寫重疊驗證。

## 封面生成規範（2026-05-10 新增、傍晚 v3 補強）
**所有封面必須以 `assets/persona/三師爸人物形象照.png` 作為人物基準。**
呼叫 `cover-image` Skill 時帶 `--edit assets/persona/三師爸人物形象照.png`。
**每一次封面都必須重新讀取 / 參考這張人物形象照；不能從上一張已生成封面或任何衍生圖片延續人物。**

**生封面前 SOP**：
1. `Read assets/style/reference-thumbnails.png`（看頻道既有 12 張封面）
2. `Read assets/style/cover-style.md`（讀風格指南）
3. `Read assets/persona/三師爸人物形象照.png`（每次重新讀人物基準照，不可沿用舊封面）
4. 依影片主角決定主色：**Claude=橘 / Codex=藍 / 兩者並用=橘+藍**
5. 撰寫 prompt → 呼叫 cover-image Skill / Codex 內建 Image2

細節見 `CLAUDE.md` §「封面規範」與 `assets/style/cover-style.md`。

## 環境前置確認
| 項目 | 確認方式 | 備註 |
|------|---------|------|
| Groq API Key | `echo $GROQ_API_KEY` 或 `ls ~/.groq_api_key` | 給 audio-to-srt 用 |
| OpenAI API Key | `echo $OPENAI_API_KEY` | 給 cover-image 用 |
| ffmpeg | `ffmpeg -version` | 給音訊壓縮、剪輯用 |

---

## 交班歷史（新的寫在最上面）

### 2026-05-10（傍晚 v2）— 加入封面人物基準規範
- 使用者提供 `三師爸人物形象照.png`，搬到 `assets/persona/`
- 規範寫進 CLAUDE.md / AGENTS.md / skills/cover-image/SKILL.md：所有封面必帶 `--edit assets/persona/三師爸人物形象照.png`
- 第一支影片封面已重生，人物樣貌（眼鏡、黑外套、髮型）完美延續

### 2026-05-10（傍晚）— Claude Code 跑完第一支影片
- 全流程實證：smart-cut → audio-to-srt → 10 標題 → 使用者選 #7 → 封面 + metadata
- 學到：smart-cut 對停頓多的口播者要把 threshold 拉到 0.06；margin 用 `0sec,0.1sec` 開頭不留緩衝聽起來最俐落
- 學到：transcribe_groq.py 直接吃 mp4 沒問題（內部用 ffmpeg 處理）
- 交付路徑：`output/你還在手動填課程計畫嗎 AI Agent 教師工作流實演 [Claude]/`

### 2026-05-10（下午）— Claude Code 工作流定稿
- 新增第三個 Skill `smart-cut`（auto-editor 包裝）
- 改寫 CLAUDE.md / AGENTS.md 的「標準工作流」章節：剪口播 → 字幕 → 10 標題 → 選定後建資料夾 → 平行產封面/文案
- 確立 `output/<標題>/` 為單一交付資料夾的命名與打包規範

### 2026-05-10 — Claude Code 專案初始化
- 建立雙 AI 接力工作框架
- 複製兩個 Skill 進 `skills/`
- Git + GitHub + Obsidian 三處同步完成
