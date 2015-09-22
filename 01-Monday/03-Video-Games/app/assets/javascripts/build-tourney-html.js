function buildTourneyHtml (tournament) {
  return '\
    <li>\
      <a href="/tournaments/' + tournament.id + '">' + tournament.name + '</a>\
      <button data-hook="tourney-delete" type="submit" name="tournament" value="'+  tournament.id + '">DELETE</button>\
      <select name="carlist" form="carform">\
        <option value="volvo">Volvo</option>\
        <option value="saab">Saab</option>\
        <option value="opel">Opel</option>\
        <option value="audi">Audi</option>\
      </select>\
      </li>\
  '
}