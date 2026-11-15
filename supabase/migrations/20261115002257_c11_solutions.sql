-- Ciento Once only does residential work: five solutions, each with its own page in the long layout.
-- Copy comes from the C11 brand presentation; images are added from the admin.

insert into public.business_lines (slug, slug_en, name_es, name_en, description_es, description_en, sort, page_content) values
  ('mobiliario', 'furniture', 'Mobiliario', 'Furniture', 'Piezas indoor y outdoor que privilegian la permanencia sobre la tendencia.', 'Indoor and outdoor pieces that favor permanence over trends.', 1, $page${
  "hero": {
    "eyebrow": {
      "es": "Indoor / Outdoor",
      "en": "Indoor / Outdoor"
    },
    "intro": {
      "es": "El mobiliario es arquitectura en su escala más íntima: la dimensión donde la forma se vuelve tacto, proporción y presencia.",
      "en": "Furniture is architecture at its most intimate scale: where form becomes touch, proportion and presence."
    },
    "ctaLabel": {
      "es": "Cotizar",
      "en": "Request a quote"
    }
  },
  "intro": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "Nuestro mobiliario no decora:\ndefine la experiencia",
      "en": "Our furniture doesn't decorate:\nit defines the experience"
    },
    "body": {
      "es": "Cada pieza compone un lenguaje que privilegia la permanencia sobre la tendencia inmediata.\n\nNuestro portafolio incorpora algunas de las firmas más relevantes del diseño que comparten un mismo rigor: crear objetos que dialogan con el tiempo y se integran con naturalidad en proyectos diversos.",
      "en": "Each piece is part of a language that favors permanence over passing trends.\n\nOur portfolio brings together some of the most relevant design houses, all sharing the same rigor: creating objects that hold up over time and blend naturally into very different projects."
    },
    "ctaLabel": {
      "es": "Hablemos de tu proyecto",
      "en": "Let's talk about your project"
    },
    "imageId": null
  },
  "banner": {
    "text": {
      "es": "Seleccionamos piezas que no solo ocupan un espacio. Objetos que acompañan la vida diaria y elevan la atmósfera con sutileza y carácter.",
      "en": "We choose pieces that do more than fill a space. Objects that accompany daily life and lift the atmosphere with subtlety and character."
    }
  },
  "elements": {
    "eyebrow": {
      "es": "— Qué incluye",
      "en": "— What's included"
    },
    "title": {
      "es": "Piezas para\ncada espacio de la casa",
      "en": "Pieces for\nevery room in the home"
    },
    "intro": {
      "es": "Mobiliario interior y exterior de firmas que comparten un mismo rigor:",
      "en": "Indoor and outdoor furniture from houses that share the same rigor:"
    },
    "items": [
      {
        "title": {
          "es": "Mobiliario interior",
          "en": "Indoor furniture"
        },
        "text": {
          "es": "Sala, comedor, recámara y estudio.",
          "en": "Living, dining, bedroom and study."
        },
        "imageId": null
      },
      {
        "title": {
          "es": "Mobiliario exterior",
          "en": "Outdoor furniture"
        },
        "text": {
          "es": "Terrazas, jardines y áreas de alberca.",
          "en": "Terraces, gardens and pool areas."
        },
        "imageId": null
      },
      {
        "title": {
          "es": "Piezas a medida",
          "en": "Made to measure"
        },
        "text": {
          "es": "Cuando el proyecto pide una pieza propia.",
          "en": "When the project calls for a piece of its own."
        },
        "imageId": null
      }
    ]
  },
  "categories": [],
  "spaces": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "",
      "en": ""
    },
    "body": {
      "es": "",
      "en": ""
    },
    "imageId": null
  },
  "process": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "",
      "en": ""
    },
    "intro": {
      "es": "",
      "en": ""
    },
    "steps": []
  },
  "quote": {
    "text": {
      "es": "Permanencia sobre\nla tendencia inmediata",
      "en": "Permanence over\npassing trends"
    },
    "attribution": {
      "es": "Objetos que dialogan con el tiempo y se integran con naturalidad en cada proyecto.",
      "en": "Objects that hold up over time and blend naturally into each project."
    }
  },
  "brands": {
    "eyebrow": {
      "es": "— Firmas",
      "en": "— Brands"
    },
    "items": []
  },
  "gallery": {
    "eyebrow": {
      "es": "— Proyectos",
      "en": "— Projects"
    },
    "items": []
  },
  "close": {
    "eyebrow": {
      "es": "— Siguiente paso",
      "en": "— Next step"
    },
    "title": {
      "es": "Piezas que\ndefinen el espacio",
      "en": "Pieces that\ndefine the space"
    },
    "body": {
      "es": "Cuéntanos sobre tu proyecto y te acompañamos en cada decisión.",
      "en": "Tell us about your project and we will guide you through every decision."
    },
    "ctaLabel": {
      "es": "Cotizar",
      "en": "Request a quote"
    }
  }
}$page$::jsonb),
  ('cocinas-y-vestidores', 'kitchens-and-closets', 'Cocinas y Vestidores', 'Kitchens and Closets', 'Sistemas que son arquitectura funcional: el orden invisible del espacio.', 'Systems that are functional architecture: the invisible order of the space.', 2, $page${
  "hero": {
    "eyebrow": {
      "es": "El orden invisible",
      "en": "The invisible order"
    },
    "intro": {
      "es": "Sistemas que son arquitectura funcional: proporciones medidas, precisión constructiva y materiales que responden tanto a la estética como al uso cotidiano.",
      "en": "Systems that are functional architecture: measured proportions, precise construction and materials that answer to both aesthetics and everyday use."
    },
    "ctaLabel": {
      "es": "Cotizar",
      "en": "Request a quote"
    }
  },
  "intro": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "Arquitectura\nfuncional",
      "en": "Functional\narchitecture"
    },
    "body": {
      "es": "Los sistemas son el orden invisible del espacio, sin buscar protagonismo: generan estructura.\n\nDiseñamos y configuramos sistemas que se integran con naturalidad al proyecto, permitiendo que cada superficie, volumen y apertura siga una lógica clara.",
      "en": "Systems are the invisible order of a space. They don't seek attention: they create structure.\n\nWe design and configure systems that blend naturally into the project, so every surface, volume and opening follows a clear logic."
    },
    "ctaLabel": {
      "es": "Hablemos de tu proyecto",
      "en": "Let's talk about your project"
    },
    "imageId": null
  },
  "banner": {
    "text": {
      "es": "Un equilibrio entre técnica, diseño y vida diaria.",
      "en": "A balance between technique, design and daily life."
    }
  },
  "elements": {
    "eyebrow": {
      "es": "— Qué incluye",
      "en": "— What's included"
    },
    "title": {
      "es": "Sistemas que\nordenan la casa",
      "en": "Systems that\norder the home"
    },
    "intro": {
      "es": "Cada sistema se configura a la medida del proyecto:",
      "en": "Each system is configured to fit the project:"
    },
    "items": [
      {
        "title": {
          "es": "Cocinas",
          "en": "Kitchens"
        },
        "text": {
          "es": "Proporciones, materiales y equipamiento para el uso diario.",
          "en": "Proportions, materials and appliances for everyday use."
        },
        "imageId": null
      },
      {
        "title": {
          "es": "Vestidores",
          "en": "Walk-in closets"
        },
        "text": {
          "es": "Sistemas abiertos y cerrados que ordenan y exhiben.",
          "en": "Open and closed systems that organize and display."
        },
        "imageId": null
      },
      {
        "title": {
          "es": "Almacenamiento",
          "en": "Storage"
        },
        "text": {
          "es": "Clósets, libreros y muebles integrados a la arquitectura.",
          "en": "Closets, shelving and built-ins that belong to the architecture."
        },
        "imageId": null
      }
    ]
  },
  "categories": [],
  "spaces": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "",
      "en": ""
    },
    "body": {
      "es": "",
      "en": ""
    },
    "imageId": null
  },
  "process": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "",
      "en": ""
    },
    "intro": {
      "es": "",
      "en": ""
    },
    "steps": []
  },
  "quote": {
    "text": {
      "es": "Los sistemas son el orden\ninvisible del espacio",
      "en": "Systems are the invisible\norder of the space"
    },
    "attribution": {
      "es": "Sin buscar protagonismo: generan estructura.",
      "en": "They don't seek attention: they create structure."
    }
  },
  "brands": {
    "eyebrow": {
      "es": "— Firmas",
      "en": "— Brands"
    },
    "items": []
  },
  "gallery": {
    "eyebrow": {
      "es": "— Proyectos",
      "en": "— Projects"
    },
    "items": []
  },
  "close": {
    "eyebrow": {
      "es": "— Siguiente paso",
      "en": "— Next step"
    },
    "title": {
      "es": "Orden, precisión\ny vida diaria",
      "en": "Order, precision\nand daily life"
    },
    "body": {
      "es": "Cuéntanos sobre tu proyecto y te acompañamos en cada decisión.",
      "en": "Tell us about your project and we will guide you through every decision."
    },
    "ctaLabel": {
      "es": "Cotizar",
      "en": "Request a quote"
    }
  }
}$page$::jsonb),
  ('acabados', 'finishes', 'Acabados', 'Finishes', 'Superficies que contienen luz, color y materia.', 'Surfaces that hold light, color and matter.', 3, $page${
  "hero": {
    "eyebrow": {
      "es": "Materia que articula el espacio",
      "en": "Matter that shapes the space"
    },
    "intro": {
      "es": "Superficies que contienen luz, color y materia; que definen el tono emocional de un espacio antes de que cualquier objeto entre en escena.",
      "en": "Surfaces that hold light, color and matter, and set the emotional tone of a space before any object enters the scene."
    },
    "ctaLabel": {
      "es": "Cotizar",
      "en": "Request a quote"
    }
  },
  "intro": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "Matices minerales,\nsuperficies continuas",
      "en": "Mineral tones,\ncontinuous surfaces"
    },
    "body": {
      "es": "Matices minerales, superficies continuas y texturas que dialogan con mobiliario e iluminación para construir una identidad sensorial precisa y sofisticada.\n\nCon OIKOS trabajamos recubrimientos que combinan innovación, nobleza y una expresión contemporánea que enriquece la arquitectura.",
      "en": "Mineral tones, continuous surfaces and textures that work with furniture and lighting to build a precise, sophisticated sensory identity.\n\nWith OIKOS we work with coatings that combine innovation, noble materials and a contemporary expression that enriches the architecture."
    },
    "ctaLabel": {
      "es": "Hablemos de tu proyecto",
      "en": "Let's talk about your project"
    },
    "imageId": null
  },
  "banner": {
    "text": {
      "es": "Innovación, nobleza y una expresión contemporánea que enriquece la arquitectura.",
      "en": "Innovation, noble materials and a contemporary expression that enriches the architecture."
    }
  },
  "elements": {
    "eyebrow": {
      "es": "— Qué incluye",
      "en": "— What's included"
    },
    "title": {
      "es": "Superficies que\ndan carácter",
      "en": "Surfaces that\ngive character"
    },
    "intro": {
      "es": "Materiales que definen el tono de cada espacio:",
      "en": "Materials that set the tone of every space:"
    },
    "items": [
      {
        "title": {
          "es": "Recubrimientos decorativos",
          "en": "Decorative coatings"
        },
        "text": {
          "es": "Acabados OIKOS para muros y superficies.",
          "en": "OIKOS finishes for walls and surfaces."
        },
        "imageId": null
      },
      {
        "title": {
          "es": "Superficies continuas",
          "en": "Continuous surfaces"
        },
        "text": {
          "es": "Planos sin juntas que unifican el espacio.",
          "en": "Seamless planes that unify the space."
        },
        "imageId": null
      },
      {
        "title": {
          "es": "Texturas minerales",
          "en": "Mineral textures"
        },
        "text": {
          "es": "Matices y relieves que contienen la luz.",
          "en": "Tones and reliefs that hold the light."
        },
        "imageId": null
      }
    ]
  },
  "categories": [],
  "spaces": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "",
      "en": ""
    },
    "body": {
      "es": "",
      "en": ""
    },
    "imageId": null
  },
  "process": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "",
      "en": ""
    },
    "intro": {
      "es": "",
      "en": ""
    },
    "steps": []
  },
  "quote": {
    "text": {
      "es": "Los acabados no acompañan:\narticulan.",
      "en": "Finishes don't accompany:\nthey articulate."
    },
    "attribution": {
      "es": "Definen el tono emocional de un espacio antes de que cualquier objeto entre en escena.",
      "en": "They set the emotional tone of a space before any object enters the scene."
    }
  },
  "brands": {
    "eyebrow": {
      "es": "— Firmas",
      "en": "— Brands"
    },
    "items": []
  },
  "gallery": {
    "eyebrow": {
      "es": "— Proyectos",
      "en": "— Projects"
    },
    "items": []
  },
  "close": {
    "eyebrow": {
      "es": "— Siguiente paso",
      "en": "— Next step"
    },
    "title": {
      "es": "Materia que\narticula el espacio",
      "en": "Matter that\nshapes the space"
    },
    "body": {
      "es": "Cuéntanos sobre tu proyecto y te acompañamos en cada decisión.",
      "en": "Tell us about your project and we will guide you through every decision."
    },
    "ctaLabel": {
      "es": "Cotizar",
      "en": "Request a quote"
    }
  }
}$page$::jsonb),
  ('iluminacion', 'lighting', 'Iluminación', 'Lighting', 'La luz es la atmósfera y la iluminación su lenguaje.', 'Light is the atmosphere and lighting its language.', 4, $page${
  "hero": {
    "eyebrow": {
      "es": "Precisión y atmósfera",
      "en": "Precision and atmosphere"
    },
    "intro": {
      "es": "Trabajamos la iluminación como un gesto que construye profundidad, define jerarquías y revela la esencia de un proyecto.",
      "en": "We treat lighting as a gesture that builds depth, sets hierarchies and reveals the essence of a project."
    },
    "ctaLabel": {
      "es": "Cotizar",
      "en": "Request a quote"
    }
  },
  "intro": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "La luz es la atmósfera\ny la iluminación su lenguaje",
      "en": "Light is the atmosphere\nand lighting its language"
    },
    "body": {
      "es": "En colaboración con IHO Lighting, integramos luminarias arquitectónicas y decorativas que permiten controlar el ritmo visual del espacio.\n\nEstas y otras firmas de nuestro portafolio componen un repertorio donde la técnica y la poética conviven.",
      "en": "Together with IHO Lighting, we integrate architectural and decorative fixtures that set the visual rhythm of the space.\n\nThese and other houses in our portfolio form a repertoire where technique and poetry live side by side."
    },
    "ctaLabel": {
      "es": "Hablemos de tu proyecto",
      "en": "Let's talk about your project"
    },
    "imageId": null
  },
  "banner": {
    "text": {
      "es": "Donde la luz no solo ilumina: interpreta, acentúa, dirige.",
      "en": "Where light doesn't just illuminate: it interprets, accents and directs."
    }
  },
  "elements": {
    "eyebrow": {
      "es": "— Qué incluye",
      "en": "— What's included"
    },
    "title": {
      "es": "Luz que\nconstruye profundidad",
      "en": "Light that\nbuilds depth"
    },
    "intro": {
      "es": "Luminarias que definen el ritmo visual del espacio:",
      "en": "Fixtures that set the visual rhythm of the space:"
    },
    "items": [
      {
        "title": {
          "es": "Iluminación arquitectónica",
          "en": "Architectural lighting"
        },
        "text": {
          "es": "Luz integrada que construye profundidad y jerarquía.",
          "en": "Integrated light that builds depth and hierarchy."
        },
        "imageId": null
      },
      {
        "title": {
          "es": "Iluminación decorativa",
          "en": "Decorative lighting"
        },
        "text": {
          "es": "Lámparas que son pieza y atmósfera a la vez.",
          "en": "Lamps that are both object and atmosphere."
        },
        "imageId": null
      },
      {
        "title": {
          "es": "Exterior",
          "en": "Outdoor"
        },
        "text": {
          "es": "Luz para fachadas, jardines y terrazas.",
          "en": "Light for facades, gardens and terraces."
        },
        "imageId": null
      }
    ]
  },
  "categories": [],
  "spaces": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "",
      "en": ""
    },
    "body": {
      "es": "",
      "en": ""
    },
    "imageId": null
  },
  "process": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "",
      "en": ""
    },
    "intro": {
      "es": "",
      "en": ""
    },
    "steps": []
  },
  "quote": {
    "text": {
      "es": "La luz no solo ilumina:\ninterpreta, acentúa, dirige.",
      "en": "Light doesn't just illuminate:\nit interprets, accents, directs."
    },
    "attribution": {
      "es": "Un repertorio donde la técnica y la poética conviven.",
      "en": "A repertoire where technique and poetry live side by side."
    }
  },
  "brands": {
    "eyebrow": {
      "es": "— Firmas",
      "en": "— Brands"
    },
    "items": []
  },
  "gallery": {
    "eyebrow": {
      "es": "— Proyectos",
      "en": "— Projects"
    },
    "items": []
  },
  "close": {
    "eyebrow": {
      "es": "— Siguiente paso",
      "en": "— Next step"
    },
    "title": {
      "es": "Precisión\ny atmósfera",
      "en": "Precision\nand atmosphere"
    },
    "body": {
      "es": "Cuéntanos sobre tu proyecto y te acompañamos en cada decisión.",
      "en": "Tell us about your project and we will guide you through every decision."
    },
    "ctaLabel": {
      "es": "Cotizar",
      "en": "Request a quote"
    }
  }
}$page$::jsonb),
  ('accesorios', 'accessories', 'Accesorios', 'Accessories', 'El último trazo de una visión: piezas que completan la intención del espacio.', 'The final stroke of a vision: pieces that complete the intent of the space.', 5, $page${
  "hero": {
    "eyebrow": {
      "es": "El último trazo de una visión",
      "en": "The final stroke of a vision"
    },
    "intro": {
      "es": "Objetos que, desde su escala contenida, afinan la narrativa del proyecto.",
      "en": "Objects that, from their modest scale, refine the story of the project."
    },
    "ctaLabel": {
      "es": "Cotizar",
      "en": "Request a quote"
    }
  },
  "intro": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "Los accesorios completan\nla intención del espacio",
      "en": "Accessories complete\nthe intent of the space"
    },
    "body": {
      "es": "Piezas que aportan presencia sin estridencia, que suman textura, ritmo y una lectura más profunda de la atmósfera.\n\nUna pausa, un acento, un gesto que cierra la experiencia visual y emocional.",
      "en": "Pieces that bring presence without noise, adding texture, rhythm and a deeper reading of the atmosphere.\n\nA pause, an accent, a gesture that completes the visual and emotional experience."
    },
    "ctaLabel": {
      "es": "Hablemos de tu proyecto",
      "en": "Let's talk about your project"
    },
    "imageId": null
  },
  "banner": {
    "text": {
      "es": "Una pausa, un acento, un gesto que cierra la experiencia.",
      "en": "A pause, an accent, a gesture that completes the experience."
    }
  },
  "elements": {
    "eyebrow": {
      "es": "— Qué incluye",
      "en": "— What's included"
    },
    "title": {
      "es": "Objetos que\nafinan la narrativa",
      "en": "Objects that\nrefine the story"
    },
    "intro": {
      "es": "Piezas de firmas como Fritz Hansen, Vitra, Serax y Nouvel:",
      "en": "Pieces from houses such as Fritz Hansen, Vitra, Serax and Nouvel:"
    },
    "items": [
      {
        "title": {
          "es": "Objetos decorativos",
          "en": "Decorative objects"
        },
        "text": {
          "es": "Esculturas, floreros y piezas de acento.",
          "en": "Sculptures, vases and accent pieces."
        },
        "imageId": null
      },
      {
        "title": {
          "es": "Mesa",
          "en": "Tableware"
        },
        "text": {
          "es": "Vajilla, cristalería y cubiertos.",
          "en": "Dinnerware, glassware and cutlery."
        },
        "imageId": null
      },
      {
        "title": {
          "es": "Complementos",
          "en": "Finishing touches"
        },
        "text": {
          "es": "Textiles y objetos que suman textura y ritmo.",
          "en": "Textiles and objects that add texture and rhythm."
        },
        "imageId": null
      }
    ]
  },
  "categories": [],
  "spaces": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "",
      "en": ""
    },
    "body": {
      "es": "",
      "en": ""
    },
    "imageId": null
  },
  "process": {
    "eyebrow": {
      "es": "",
      "en": ""
    },
    "title": {
      "es": "",
      "en": ""
    },
    "intro": {
      "es": "",
      "en": ""
    },
    "steps": []
  },
  "quote": {
    "text": {
      "es": "Presencia\nsin estridencia",
      "en": "Presence\nwithout noise"
    },
    "attribution": {
      "es": "Objetos que suman textura, ritmo y una lectura más profunda de la atmósfera.",
      "en": "Objects that add texture, rhythm and a deeper reading of the atmosphere."
    }
  },
  "brands": {
    "eyebrow": {
      "es": "— Firmas",
      "en": "— Brands"
    },
    "items": []
  },
  "gallery": {
    "eyebrow": {
      "es": "— Proyectos",
      "en": "— Projects"
    },
    "items": []
  },
  "close": {
    "eyebrow": {
      "es": "— Siguiente paso",
      "en": "— Next step"
    },
    "title": {
      "es": "El último trazo\nde una visión",
      "en": "The final stroke\nof a vision"
    },
    "body": {
      "es": "Cuéntanos sobre tu proyecto y te acompañamos en cada decisión.",
      "en": "Tell us about your project and we will guide you through every decision."
    },
    "ctaLabel": {
      "es": "Cotizar",
      "en": "Request a quote"
    }
  }
}$page$::jsonb)
on conflict (slug) do update set
  slug_en = excluded.slug_en,
  name_es = excluded.name_es,
  name_en = excluded.name_en,
  description_es = excluded.description_es,
  description_en = excluded.description_en,
  sort = excluded.sort,
  page_content = excluded.page_content;
