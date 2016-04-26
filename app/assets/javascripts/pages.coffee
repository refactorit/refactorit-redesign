$ ->
  typedHero()

typedHero = ->
  $(".hero-title span").typed({
      strings: ["build your product.", "design your product.", "create your visual identity.", "mentor your developers."],
      typeSpeed: 60,
      backDelay: 2000,
      loop: true
  });

