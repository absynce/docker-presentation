module Main exposing (..)

import Css
import Css.Elements
import Html exposing (..)
import Html.Attributes exposing (..)
import Slides exposing (slidesDefaultOptions)
import Slides.Styles


main : Program Never Slides.Model Slides.Msg
main =
    Slides.app
        { slidesDefaultOptions
            | style =
                [ Css.Elements.img
                    [ Css.width Css.auto
                    ]
                ]
                    |> List.append
                        (Slides.Styles.elmMinimalist
                            (Css.rgb 255 255 255)
                            (Css.rgb 230 230 230)
                            (Css.px 30)
                            (Css.hex "3a6ea5")
                        )
            , slidePixelSize =
                { height = 700
                , width = 1024
                }
        }
        [ titleSlide
        , whyDocker
        , consistencyInDevelopment
        ]


titleSlide : Slides.Slide
titleSlide =
    Slides.html <|
        div [ class "title-slide" ]
            [ img
                [ alt "IWT Health Logo"
                , class "iwt-logo"
                , src "images/IWTLogo-800x177.png"
                ]
                []
            , h1 [] [ text "Intro to Docker" ]
            , div []
                [ em [] [ text "by Jared M. Smith" ]
                ]
            ]


whyDocker : Slides.Slide
whyDocker =
    Slides.mdFragments
        [ "# Why Docker"
        , """
* Consistency:
    * in development
    * in deployments
    * across environments
"""
        , "* Quick dev environment setup"
        , "* Portability across platforms"
        , "* Scaling apps"
        ]


consistencyInDevelopment : Slides.Slide
consistencyInDevelopment =
    Slides.mdFragments
        [ "# Consistency in development"
        , "* No manual install/config"
        , """* Declare requirements

```dockerfile
FROM node:7.2.0

RUN npm install -g elm@0.18.0
RUN npm install -g elm-test@0.18.0

ENTRYPOINT ["elm"]
```
[Source](https://github.com/maport/docker-elm/blob/master/elm/0.18/Dockerfile)"""
        , "[How to build an app container](https://docs.docker.com/get-started/part2/)"
        ]


whatsAContainer : Slides.Slide
whatsAContainer =
    Slides.mdFragments
        [ "# What's a container?\n    "
        ]
