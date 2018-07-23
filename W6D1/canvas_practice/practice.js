document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext("2d");
  ctx.fillStyle = "blue";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(125, 125, 10, 0, 2*Math.PI, true);
  ctx.strokeStyle = "yellow";
  ctx.lineWidth = 8;
  ctx.stroke();
  ctx.fillStyle = "black";
  ctx.fill();

  ctx.beginPath();
  ctx.arc(250, 125, 10, 0, 2*Math.PI, true);
  ctx.strokeStyle = "yellow";
  ctx.lineWidth = 8;
  ctx.stroke();
  ctx.fillStyle = "black";
  ctx.fill();

  ctx.beginPath();
  ctx.fillRect(170, 150, 50, 50);

});
