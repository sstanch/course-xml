function init() {
  const FOOD_CHILD = ['name', 'manufacturer', 'size', 'unit', 'total_calories',
    'fat_calories', 'totla_fat', 'saturated_fat','cholesterol',
    'sodium', 'carbohydrates', 'fiber', 'protein', 'a', 'c', 'calcium', 'iron'
    ];

  console.log("Loading XML data ...");
  const xhr = new XMLHttpRequest();
  xhr.open("GET", "nutrition.csv", true);
  xhr.onreadystatechange = function() {
    if (xhr.readyState !== 4) return;
    if (xhr.status !== 200) {
      document.getElementById("application-errors").innerHTML = 
      `HTTP Error: ${xhr.status} - ${xhr.statusText}`;
      return;
    }
    document.getElementById("csv").value = xhr.responseText;
    const xml = document.implementation.createDocument('', '', null);
    const root = xml.createElement('nutrition');
    xml.appendChild(root);

    const lines = xhr.responseText.split(/[\n\r]+/);
    console.log(lines);
    for(let i = 2; i < lines.length - 1; i++) {
      const foodElem = xml.createElement('food');
      root.appendChild(foodElem);
      const fields = lines[i].split(';');
      for(let j = 0; j < fields.length; j++) {
        const elem = xml.createElement(FOOD_CHILD[j]);
        const text = xml.createTextNode(fields[j]);
        elem.appendChild(text);
        foodElem.appendChild(elem);
      }
    }
    const serializer = new XMLSerializer();
    document.getElementById('xml').value = serializer.serializeToString(xml);
  };
  xhr.send();
}