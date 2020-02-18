on zpt(aNum, aLen)
    set tText to ("0000000000" & aNum as text)
    set tCount to length of tText
    set resText to text (tCount - aLen + 1) thru tCount of tText
    return resText
end zpt


on getTimeStamp()
    set localdate to (current date)
    set y to year of localdate as number
    set m to month of localdate as number
    set d to day of localdate as number
    set h to hours of localdate as number
    set mi to minutes of localdate as number
    set ss to seconds of localdate as number

    set msg to y & "-" & zpt(m, 2) & "-" & zpt(d, 2) & " at " & zpt(h, 2) & "." & zpt(mi, 2) & "." & zpt(ss, 2)

end getTimeStamp

on main()
    set home to do shell script "echo $HOME"
    set ss_dir to home & "/Pictures/screenshots/"
    set ss_img to ss_dir & "Screen Shot " & getTimeStamp() & ".png"

    do shell script "screencapture -i "" & ss_img & """
    set ss_path to POSIX file ss_img
    try
        set the clipboard to (read ss_path as TIFF picture)
    end try

end main

main()