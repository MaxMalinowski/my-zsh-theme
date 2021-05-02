# settings
typeset +H my_gray="$FG[237]"
typeset +H my_orange="$FG[214]"

# separator dashes size
function afmagic_dashes {
	local PYTHON_ENV="$VIRTUAL_ENV"
	[[ -z "$PYTHON_ENV" ]] && PYTHON_ENV="$CONDA_DEFAULT_ENV"

	if [[ -n "$PYTHON_ENV" && "$PS1" = \(* ]]; then
		echo $(( COLUMNS - ${#PYTHON_ENV} - 3 ))
	else
		echo $COLUMNS
	fi
}

# primary prompt
precmd(){
    local dashes="$my_gray${(l.$(afmagic_dashes)..-.)}"
    local left="%F{cyan}@%m %F{magenta}: %F{green}%3~ $(git_prompt_info)"
    local right="%F{cyan}%D{%I:%M %p}%f"

    local preprompt_left="$dashes$left"
    local preprompt_right="$right"

    local preprompt_left_length=${#${(S%%)left//(\%([KF1]|)\{*\}|\%[Bbkf])}}
    local preprompt_right_length=${#${(S%%)preprompt_right//(\%([KF1]|)\{*\}|\%[Bbkf])}}

    local num_filler_spaces=$((COLUMNS - preprompt_left_length - preprompt_right_length))
    print -Pr $'\n'"$preprompt_left${(l:$num_filler_spaces:)}$preprompt_right"
}

PS1='$(virtualenv_prompt_info)%F{magenta}%(!.#.⇒)%f '

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX="%F{yellow}("
ZSH_THEME_VIRTUALENV_SUFFIX=") %{$reset_color%}"

