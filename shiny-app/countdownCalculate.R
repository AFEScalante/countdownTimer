# Script for remaining time calculation
timeRemaining <- function(datepicker, datenow) {
    time_left <- as.numeric(difftime(datepicker, datenow))
    days <- floor(time_left)
    # Extract the hours, minutes, seconds...
    hours_left <- (time_left %% days) * 24
    hours <- floor(hours_left)
    minutes_left <- (hours_left %% hours) * 60
    minutes <- floor(minutes_left)
    seconds <- floor((minutes_left %% minutes) * 60)

    list(
        time_left = time_left,
        time_now = datenow,
        datepicker = datepicker,
        days = days,
        hours = hours,
        minutes = minutes,
        seconds = seconds
    )
}
