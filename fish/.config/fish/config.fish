set -gx QT_QPA_PLATFORMTHEME qt6ct

fish_add_path ~/.local/bin

zoxide init fish | source
if status is-interactive
	function fish_greeting
		# fastfetch
		# smth smth
	end
	sleep 0.1
	fastfetch
end
