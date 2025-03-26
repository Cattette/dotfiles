function pasteimg --description 'alias wa1=wa2'
    xclip -selection clipboard -t image/png -o > "$(date +%Y-%m-%d_%H_%M_%S).png"
end
 
