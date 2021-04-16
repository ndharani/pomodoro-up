// if you start the timer, the clock will start/continue counting down
// if you pause the timer, the clock will pause
// if you reset the timer, the clock will pause and reset to 25 minutes 
// if you refresh the page, the clock will reset

// allow pausing after the clock has started
var SHOULD_PAUSE = true;

function getEndTime(minutes, seconds) {
    // in unixtime
    let milliseconds = (minutes * 60 * 1000) + (seconds * 1000);
    return new Date().valueOf() + milliseconds;
}

function countDown(minutes, seconds) {
    clock = document.getElementById("25m-clock");
    var endTime = getEndTime(minutes, seconds);

    // Run every 0.2 seconds to smoothly update the clock
    var intervalId = setInterval(function() { displayTimeLeft(clock, endTime); }, 200);
    
    function displayTimeLeft(clock, endTime) {
        var millisecondsLeft = endTime - new Date().valueOf();
        
        // Timer has finished or we need to pause
        if (millisecondsLeft < 0 || SHOULD_PAUSE) {
            clearInterval(intervalId);
            return;
          }
        
        // Calculate whole minutes left
        let minutesLeft = Math.floor(millisecondsLeft / 60 / 1000);
        millisecondsLeft -= minutesLeft * 60 * 1000;
    
        // Calculate whole seconds left
        let secondsLeft = Math.floor(millisecondsLeft / 1000);
    
        // Pad seconds with a 0 if needed (8 seconds --> :08)
        if (secondsLeft < 10) {
            clock.innerText = minutesLeft + ":0" + secondsLeft;
        }
        else {
            clock.innerText = minutesLeft + ":" + secondsLeft;
        }
    }
}

// Start timer
document.addEventListener('click', (clickEvent) => {
    let clickedElement = clickEvent.target;
    console.log("Clicked ", clickedElement.id);

    if (clickedElement.id === "start") {
        // Without this logic, we would trigger multiple timers acting on the same clock
        if (!SHOULD_PAUSE) {
            console.log("Timer is already running");
            return;
        }

        console.log("Starting timer");
        var minutes, seconds;
        clock = document.getElementById("25m-clock");
        timeLeft = clock.innerHTML.split(":");
        minutes = timeLeft[0];
        seconds = timeLeft[1];
        countDown(minutes, seconds);
        SHOULD_PAUSE = false;
    }

});

// Pause timer
document.addEventListener('click', (clickEvent) => {
    let clickedElement = clickEvent.target;
    console.log("Clicked ", clickedElement.id);

    if (clickedElement.id === "pause") {
        console.log("Pausing");
        SHOULD_PAUSE = true;
    }

});

// Reset timer
document.addEventListener('click', (clickEvent) => {
    let clickedElement = clickEvent.target;
    console.log("Clicked ", clickedElement.id);

    if (clickedElement.id === "reset") {
        console.log("Resetting timer");
        SHOULD_PAUSE = true;
        clock = document.getElementById("25m-clock");
        clock.innerHTML = "25:00";
    }

});
