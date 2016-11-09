module View where

import Pux.Html
import Pux.Html.Attributes
import Prelude (const, show)
import Pux.Html.Events (onClick)
import Types (AppState, Action(..))
import Prelude hiding (div)

editButton :: AppState -> Html Action
editButton state =
  let
    icon = if state.editing then "pencil" else "eye-open"
    cname = "glyphicon glyphicon-" <> icon
  in
    li [] [ a [ className cname, onClick (const ToggleEdit) ] [ text "" ] ]

navbar :: AppState -> Html Action
navbar state =
  nav
    [ className "navbar navbar-default" ]
    [ div
        [ className "container-fluid" ]
        [ div
            [ className "navbar-header" ]
            []
        , div
            [ className "" ]
            [ ul
                [ className "nav navbar-nav text-center" ]
                [ li [] [ a [ className "glyphicon glyphicon-file" ] [ text "" ] ]
                , li [] [ a [ className "glyphicon glyphicon-folder-open" ] [ text "" ] ]
                , li [] [ a [ className "glyphicon glyphicon-import" ] [ text "" ] ]
                ]
            ]
        , ul
                [ className "nav navbar-nav navbar-right" ]
                [ editButton state
                ]
        ]
    ]

view :: AppState -> Html Action
view state =
  div
    []
    [ navbar state
    , div
        [ className "container", id_ "editor" ]
        [ div
            [ className "row" ]
            [ div
                [ className "col-md-12" ]
                [ p
                    [ contentEditable "true" ]
                    [ text "Type here" ]
                ]
            ]
        ]
    ]
