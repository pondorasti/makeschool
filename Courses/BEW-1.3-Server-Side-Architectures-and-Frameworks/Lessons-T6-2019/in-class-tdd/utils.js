const sayHello = () => {
  return "Hello";
};

const area = (w, h) => {
  return w * h;
};

const perimeter = (w, h) => {
  return w + w + h + h;
};

const circleArea = r => {
  return Math.PI * r * r;
};

module.exports = { sayHello, area, perimeter, circleArea };
