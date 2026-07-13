# metadata — AI Agent 基本功 EP04：連接外部工具，MCP 與連接器一張地圖講清楚

> 主角：AI Agent（Claude Code 示範，橘色主題）。長片約 44 分鐘。素材全部呼應清字後逐字稿。

## 1. 影片標題候選（10 個，三風格穿插）

**教學 / Know-how**
1. AI Agent 基本功 EP04：連接外部工具，MCP 與連接器一張地圖講清楚（✅ 本片採用）
2. AI Agent 基本功 EP04：讓 Agent 的手腳伸出你的電腦
3. MCP、連接器、CLI、權限：連接外部工具一次搞懂

**好奇心驅動**
4. MCP 到底是什麼？一個轉接頭的比喻讓你秒懂
5. 為什麼連 Google 這麼麻煩？連接外部工具的眉角
6. 用自然語言操控所有工具，不用再一個一個學

**痛點解決**
7. 別再切換一堆工具：用 AI Agent 把它們全部連起來
8. API Key 還是 OAuth？連接外部工具的權限一次講清楚
9. 老師必看：把 Gmail、Classroom、NotebookLM 都接上 AI
10. 手機也能遙控電腦上的 AI：Claude Code 遠端連線示範

## 2. 影片描述（≤300 字）

你的 AI Agent 只能在自己的工具裡打轉嗎？這一集要讓它的手腳伸出你的電腦，連到 Gmail、Classroom、NotebookLM、Padlet 這些外部工具。這件事很難，我盡量用一張地圖講清楚。

連接前先問自己兩個問題：是不是 Google 家的？要簡單使用還是完整控制？

接下來分兩件事：
▸ 怎麼接（通道）：內建連接器、MCP、CLI、直接操控畫面。內建連接器是原廠寫好的，MCP 是轉接頭，CLI 用命令列控制，直接操控是最後手段。
▸ 給多少權限：由低到高是免鑰匙（本機）、API Key／Access Token（給一把鑰匙）、OAuth（門禁卡，有範圍會過期，最安全）。能用 OAuth 就用 OAuth。

影片實測：Wordwall（沒連接器）、NotebookLM（MCP CLI）、Google Tasks（OAuth，經 Google Cloud Console，超麻煩），還示範用手機遠端連回電腦的 Claude Code。

我也準備了一份「連接指南」檔案，丟給你的 Agent 就會帶你一步步連。連結放說明欄。

訂閱頻道，一起把 AI 用在教學上。

🔗 連接指南 GitHub repo / Padlet：（上架時補上）

#AIAgent #MCP #AI教學

## 3. 社群貼文（皆禁 Emoji）

### Facebook
你的 AI Agent 只能在自己的工具裡打轉嗎？這一集要讓它的手腳伸出你的電腦，連到 Gmail、Classroom、NotebookLM、Padlet 這些外部工具。

我用一張地圖把它講清楚。連接前先問兩個問題：是不是 Google 家的？要簡單使用還是完整控制？然後分兩件事：怎麼接（內建連接器、MCP、CLI、直接操控）跟給多少權限（免鑰匙、API Key、OAuth）。

原則很簡單：有原廠連接器就用連接器，能用 OAuth 就別用 API Key，Google 家的最麻煩要有耐心。

影片還示範了用手機遠端連回電腦上的 AI。你最想把哪個工具接上你的 AI？留言告訴我。

### Instagram
AI Agent 怎麼連到外部工具？一張地圖講清楚。

先問兩個問題：是不是 Google？簡單用還是完整控制。再分兩件事：怎麼接（連接器、MCP、CLI、直接操控）跟權限（免鑰匙、API Key、OAuth）。

能用 OAuth 就別用 API Key，Google 家最麻煩。還示範手機遠端遙控電腦上的 AI。

你最想連哪個工具？留言告訴我。

### Threads
AI Agent 連外部工具，一張地圖搞懂：先問是不是 Google、簡單還是完整控制，再看怎麼接（連接器/MCP/CLI）跟給多少權限（免鑰匙/API Key/OAuth）。能用 OAuth 就別用 API Key。你想連哪個工具？

## 4. SEO 關鍵字（15–20 個）

AI Agent, MCP, 連接器, Model Context Protocol, Claude Code, OAuth, API Key, Access Token, CLI, 連接外部工具, NotebookLM, Google Classroom, Padlet, AI 自動化, AI 教學, Gmail 連接, Google Tasks, 教師 AI, 數位教學

## 5. 章節時間碼（依字幕段落，建議性質）

- 00:00 開場：讓 Agent 的手腳伸出電腦，連接外部工具
- 00:30 為什麼要連？用自然語言操控工具，拆掉學工具的牆
- 03:40 先問兩個問題：是不是 Google？簡單使用還是完整控制
- 06:00 權限由低到高：免鑰匙（本機）、API Key／Access Token、OAuth
- 07:00 怎麼接（通道）：內建連接器、MCP、CLI、直接操控畫面
- 10:00 MCP 是轉接頭；內建連接器＝原廠寫好的 MCP
- 10:56 CLI 用命令列控制；CLI Anything 幫工具自動生成 CLI
- 12:20 直接操控畫面：最簡單但最不保險，能不用就不用
- 13:00 通道 × 權限的搭配表
- 14:00 非 Google 的接法；OAuth 最安全但最麻煩
- 15:00 各工具對照（Obsidian、Supabase、NotebookLM、GitHub…）
- 18:00 實作：新電腦用連接指南建專案
- 20:00 示範 Wordwall（沒連接器 → CLI Anything → 只能直接操控）
- 24:00 內建連接器示範（Claude Code Connector：Gmail、Drive、Calendar）
- 28:00 NotebookLM 連接（MCP CLI，別人寫好）
- 33:00 Google Tasks 連接（OAuth，經 Google Cloud Console，超麻煩）
- 42:00 手機遠端遙控：Claude Code Remote Control
- 43:20 結語與訂閱呼籲

## 6. YouTube 標籤欄位（直接複製）

**主關鍵字**
AI Agent,MCP,連接器,連接外部工具

**次關鍵字**
Claude Code,OAuth,API Key,Access Token,CLI

**長尾關鍵字**
Model Context Protocol,NotebookLM,Google Classroom,Padlet,Google Tasks,Gmail 連接

**競品搜尋詞**
AI 工具教學,AI 自動化,數位教學,生成式 AI

**全部一次貼（複製這段到 YouTube 後台標籤欄）**
AI Agent,MCP,連接器,連接外部工具,Claude Code,OAuth,API Key,Access Token,CLI,Model Context Protocol,NotebookLM,Google Classroom,Padlet,Google Tasks,Gmail 連接,AI 工具教學,AI 自動化,數位教學,生成式 AI

## 7. 上架前 checklist

- [ ] 標題已選定（本片用 #1）
- [ ] 封面 cover.png 已上傳（橘色、MCP 連接地圖主視覺）
- [ ] 字幕 .srt 已上傳並校對時間碼
- [ ] 描述前 100 字含主關鍵字「MCP」「連接外部工具」
- [ ] 章節時間碼對照成片微調
- [ ] 標籤貼上「全部一次貼」整合版
- [ ] 加入播放清單「AI Agent 基本功」系列
- [ ] **說明欄補上：連接指南 GitHub repo／Padlet 連結**（影片中承諾）
- [ ] 說明欄放 EP01／EP02／EP03 系列連結
- [ ] FB / IG / Threads 社群同步發佈
