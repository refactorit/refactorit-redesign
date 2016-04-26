$ ->
  typedHero()

typedHero = ->
  $(".hero-title span").typed({
      strings: ["build your product.", "design your product.", "create your visual identity.", "mentor your developers.", "..."],
      typeSpeed: 50,
      loop: true
  });

