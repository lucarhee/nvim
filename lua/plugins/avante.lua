return {
  "yetone/avante.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  build = "make", -- Windows라면 "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
  opts = {
    provider = "ollama", -- 활성 provider 지정
    providers = { -- 커스텀 provider는 vendors 아래에
      ollama = {
        -- __inherited_from = "openai", -- OpenAI 호환 API 사용
        api_key_name = "", -- ollama는 API 키 불필요
        endpoint = "http://127.0.0.1:11434", -- /v1 필수
        model = "gemma4:26b", -- ollama에서 실제 pull한 모델명 확인
        timeout = 30000,
        extra_request_body = {
          options = {
            temperature = 0.75,
            num_ctx = 20480,
            keep_alive = "5m",
          },
        },
      },
    },
  },
}
