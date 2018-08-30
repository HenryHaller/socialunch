console.log("doing scoring.js")

const pointsButtons = document.querySelectorAll(".points-button");

const handleClick = (event) => {
  console.log(event.currentTarget);
  event.currentTarget.style.opacity = "0.0";
  pointsButtons.forEach( (pointButton) => {
    if (pointButton !== event.currentTarget) {
      pointButton.style.opacity = "0.0";
    };
  });

};

// const handleMouseover = (event) => {
//   console.log(event.currentTarget)
//   event.currentTarget.innerText = "Choose me!";
// };

pointsButtons.forEach( (pointsButton) => {
  // console.log(pointsButton);
  pointsButton.addEventListener('click', handleClick);
  // pointsButton.addEventListener('mouseover', handleMouseover);
});
