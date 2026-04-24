return {
  "yetone/avante.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- 여기서 명시적으로 로드 보장
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  opts = {
    providers = {
      ollama = {
        endpoint = "http://127.0.0.1:11434",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          options = {
            temperature = 0.75,
            num_ctx = 20480,
            keep_alive = "5m",
          },
        },
        model = "gemma4:26b", -- 실행하려는 gemma 4 모델명
      },
    },
  },
}
