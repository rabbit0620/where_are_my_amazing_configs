---@diagnostic disable: undefined-global
-- 或者更精准地只对 hl 豁免：
-- nvim-lspconfig 用户通常可以用下面这行：

-- =====================================================================
--  ~/.config/hypr/hyprland.lua
--  适用于 Hyprland 0.55+ 官方 Lua API
-- =====================================================================

-- 禁用自动生成
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 5,
	},
	input = {
		kb_options = "altwin:menu_win,caps:escape",
	},
})

-- 环境变量
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("NVD_BACKEND", "direct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("SHELL", "/home/randy/.cargo/bin/nu")
hl.env("__GL_VRR_ALLOWED", "0")
hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")
hl.env("XCURSOR_THEME", "Breeze_Light")
hl.env("XCURSOR_SIZE", "24")

-- 键盘：Menu 键 → 右 Super
hl.device({
	name = "razer-razer-blackwidow-essential",
	kb_options = "altwin:menu_win",
})

-- 显示器 (结构化参数)
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@200",
	position = "0x0",
	scale = 1,
})

-- 快捷键 (使用 hl.bind，dispatcher 用 hl.dsp.*)
local mod = "SUPER"

-- ======================================================
-- Hyprland Lua 配置文件 (优化版，基于官方文档)
-- 适用于 Hyprland 0.55+
-- 文件位置: ~/.config/hypr/hyprland.lua
-- ======================================================
-- ========== 7. 快捷键绑定 ==========
-- 应用启动

-- ========== 7. 快捷键绑定 ==========
-- 应用启动
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("alacritty -e /usr/bin/zsh"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("hyprlauncher"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("hyprsunset"))

hl.bind("SUPER + I", hl.dsp.exec_cmd("wofi-emoji"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"))
-- 截图
-- ========== 截图快捷键（Win + Shift + 字母系列）==========

-- 区域截图并复制到剪贴板 (Win + Shift + S)   -- 你指定的主快捷键
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- 全屏截图并复制到剪贴板 (Win + Shift + A)
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd("grim - | wl-copy"))

-- 区域截图并保存到指定目录 (Win + Shift + D)
hl.bind(
	"SUPER + SHIFT + D",
	hl.dsp.exec_cmd(
		'grim -g "$(slurp)" - | tee /home/randy/hdddata/shortscreen/screenshot_$(date +%Y%m%d_%H%M%S).png | wl-copy'
	)
)

-- 全屏截图并同时复制+保存 (Win + Shift + F)
hl.bind(
	"SUPER + SHIFT + F",
	hl.dsp.exec_cmd("grim - | tee /home/randy/hdddata/shortscreen/screenshot_$(date +%Y%m%d_%H%M%S).png | wl-copy")
)

-- 区域截图并在 Satty 中编辑 (Win + Shift + E)
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd('grim -g "$(slurp)" - | satty -f - -o - | wl-copy'))

-- 区域截图（含鼠标指针）并复制到剪贴板 (Win + Shift + C)
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd('grim -g "$(slurp)" -c - | wl-copy'))

-- 全屏截图并保存，完成后发送通知 (Win + Shift + N)
hl.bind(
	"SUPER + SHIFT + N",
	hl.dsp.exec_cmd(
		"grim - | tee /home/randy/hdddata/shortscreen/screenshot_$(date +%Y%m%d_%H%M%S).png && notify-send '截图已保存'"
	)
)

-- 窗口管理
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + S", hl.dsp.layout("togglesplit"))
hl.bind(
	"SUPER + M",
	hl.dsp.window.fullscreen({
		mode = "maximized",
		action = "toggle",
	})
)

-- 焦点移动
hl.bind("SUPER + LEFT", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + UP", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + DOWN", hl.dsp.focus({ direction = "d" }))

-- 移动窗口 (键盘)
hl.bind("SUPER + SHIFT + LEFT", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + UP", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + DOWN", hl.dsp.window.move({ direction = "d" }))

-- 调整窗口大小 (键盘)
hl.bind("SUPER + CTRL + LEFT", hl.dsp.window.resize({ x = -20, y = 0 }))
hl.bind("SUPER + CTRL + RIGHT", hl.dsp.window.resize({ x = 20, y = 0 }))
hl.bind("SUPER + CTRL + UP", hl.dsp.window.resize({ x = 0, y = -20 }))
hl.bind("SUPER + CTRL + DOWN", hl.dsp.window.resize({ x = 0, y = 20 }))

-- 鼠标拖动移动/调整大小 (使用 mouse 标志)
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ========== 工作区切换 (1-9, 0) - 修正版 ==========
for i = 1, 9 do
	hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
	hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- 鼠标侧键循环切换工作区
hl.bind("mouse:275", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("mouse:276", hl.dsp.focus({ workspace = "e+1" }))

-- 系统控制
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("hyprshutdown --vt 1"))
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- 音量控制 (需要 pactl)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))

-- 亮度控制 (需要 brightnessctl)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +10%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))

-- ========== 8. 窗口规则 ==========
hl.window_rule({ match = { class = "pavucontrol" }, float = true })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = true })
hl.window_rule({ match = { class = "qt5ct" }, float = true })
hl.window_rule({ match = { class = "qt6ct" }, float = true })
hl.window_rule({ match = { class = "nwg-look" }, float = true })
hl.window_rule({ match = { title = "Picture-in-Picture" }, float = true })
hl.window_rule({ match = { class = ".*open.*|.*save.*|.*file.*" }, float = true })

hl.window_rule({ match = { class = "pavucontrol" }, center = true })
hl.window_rule({ match = { class = "nm-connection-editor" }, center = true })

-- ========== 9. 工作区规则 (示例) ==========
hl.workspace_rule({ workspace = "3", no_rounding = true, decorate = false })
hl.workspace_rule({ workspace = "name:coding", gaps_in = 0, gaps_out = 0, no_border = true, monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "8", border_size = 8 })
hl.workspace_rule({ workspace = "special:scratchpad", on_created_empty = "kitty -e /home/randy/.cargo/bin/nu" })

-- 智能间隙 (Smart Gaps)
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 })
-- 排除特殊工作区
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0, rounding = 0 })

hl.on("hyprland.start", function()
	hl.exec_cmd("kitty -e /home/randy/.cargo/bin/nu")
	hl.exec_cmd("waybar")
	hl.exec_cmd("firefox")
	hl.exec_cmd("hyprpolkitagent")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hyprctl setcursor Breeze_Light 24")
end)

-- ========== 统一速度控制（改这一个数字即可调整所有动画速度）==========
-- 数值越小动画越快（单位：ds，1ds = 100ms）
-- 例如：10 = 1秒，6 = 0.6秒，4 = 0.4秒
local anim_speed = 6

-- ========== 定义贝塞尔曲线 ==========
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

-- ========== 全局默认动画（仍然保留，但子动画仍需显式写 speed）==========
hl.animation({ leaf = "global", enabled = true, speed = anim_speed, bezier = "default" })

-- 窗口动画
hl.animation({ leaf = "windows", enabled = true, speed = anim_speed, bezier = "myBezier" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = anim_speed, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = anim_speed, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = anim_speed, bezier = "myBezier" })

-- 边框颜色动画
hl.animation({ leaf = "border", enabled = true, speed = anim_speed, bezier = "default" })

-- 淡入淡出动画
hl.animation({ leaf = "fade", enabled = true, speed = anim_speed, bezier = "default" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = anim_speed, bezier = "default" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = anim_speed, bezier = "default" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = anim_speed, bezier = "default" })
hl.animation({ leaf = "fadeShadow", enabled = true, speed = anim_speed, bezier = "default" })

-- 工作区切换动画
hl.animation({ leaf = "workspaces", enabled = true, speed = anim_speed, bezier = "default" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = anim_speed, bezier = "default" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = anim_speed, bezier = "default" })

-- 如果你想单独让关闭窗口动画更快，可以单独设置，覆盖 anim_speed：
-- hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "default", style = "popin 80%" })
