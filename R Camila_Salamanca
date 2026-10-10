# ==============================================================
# PARTE A: INTEGRANTE 1 (commits 1, 2 y 3)
# Antes: crea en GitHub el repo PUBLICO "hollywood-rules" (sin README)
# y agrega al Integrante 2 en Settings > Collaborators.
# ==============================================================

USUARIO="CAMBIAR-usuario-github-del-que-creo-el-repo"
NOMBRE1="CAMBIAR Nombre Apellido del Integrante 1"
CORREO1="CAMBIAR-correo-de-su-cuenta-github@ejemplo.com"
RUTA_EXCEL="CAMBIAR/ruta/completa/a/Hollywood.xls"
RUTA_SCRIPT="CAMBIAR/ruta/completa/a/script_unico.R"

git clone https://github.com/$USUARIO/hollywood-rules.git
cd hollywood-rules
git config user.name "$NOMBRE1"
git config user.email "$CORREO1"

# --- Commit 1: README y .gitignore ---
cat > README.md << 'EOF'
# Hollywood Rules: caso 2 de Analítica de Negocios

Informe extenso (PDF) con las preguntas 1, 2, 3 y 4 y los literales a, b y g de la pregunta 7.

## Estructura

```
hollywood-rules/
  ├── script_unico.R          # script que escribe y compila el informe
├── informe_hollywood.Rmd   # análisis completo + texto del informe
├── informe_hollywood.pdf   # informe final
├── data/
  │   └── Hollywood.xls       # datos del caso (hoja "Exhibit 1")
├── README.md
└── .gitignore
```

## Cómo reproducir el análisis

1. Clonar el repositorio y abrir la carpeta como proyecto en RStudio
(File > New Project > Existing Directory).
2. Abrir `script_unico.R`, escribir los nombres del equipo en la línea
`equipo <- "..."` y ejecutar todo el script (Ctrl + A, luego Ctrl + Enter).
3. El script instala los paquetes que falten (readxl, dplyr, tidyr, ggplot2,
                                              knitr, kableExtra, scales, rmarkdown, tinytex), crea
`informe_hollywood.Rmd` y genera `informe_hollywood.pdf`.

El archivo debe estar guardado con codificación UTF-8
(File > Save with Encoding > UTF-8). La semilla del bootstrap está fija
(`set.seed(2026)`), así que los resultados son idénticos en cada ejecución.

## Contenido del análisis (4D)

| Dimensión | Preguntas |
  |---|---|
  | Descriptiva | 1, 2a |
  | Diagnóstica | 2b, 2c, 3, 4 |
  | Predictiva | 7a, 7b, 7g |
  | Prescriptiva | Sección de recomendaciones |
  EOF

printf '.Rproj.user\n.Rhistory\n.RData\n*.log\n*.aux\n*.tex\ninforme_hollywood_files/\n' > .gitignore

git add README.md .gitignore
git commit -m "Agrega README y .gitignore con la estructura del proyecto"

# --- Commit 2: datos ---
mkdir -p data
cp "$RUTA_EXCEL" data/Hollywood.xls
git add data/Hollywood.xls
git commit -m "Agrega datos del caso Hollywood Rules"

# --- Commit 3: script ---
cp "$RUTA_SCRIPT" script_unico.R
git add script_unico.R
git commit -m "Agrega script unico que genera el informe en PDF"

git branch -M main
git push -u origin main

# Cuando termine el push, avisa al Integrante 2.


# ==============================================================
# PARTE B: INTEGRANTE 2 (commits 4, 5 y 6)
# Se corre DESPUES de la Parte A, en el computador del Integrante 2.
# ==============================================================

USUARIO="CAMBIAR-usuario-github-del-que-creo-el-repo"
NOMBRE2="CAMBIAR Nombre Apellido del Integrante 2"
CORREO2="CAMBIAR-correo-de-su-cuenta-github@ejemplo.com"
EQUIPO_1="CAMBIAR Nombre Apellido del Integrante 1"
EQUIPO_2="CAMBIAR Nombre Apellido del Integrante 2"

git clone https://github.com/$USUARIO/hollywood-rules.git
cd hollywood-rules
git config user.name "$NOMBRE2"
git config user.email "$CORREO2"

# >>> PAUSA: ahora ve a RStudio, abre script_unico.R de esta carpeta,
# >>> escribe los nombres del equipo en la linea equipo <- "...",
# >>> ejecuta todo (Ctrl + A, Ctrl + Enter) y lee el PDF completo.
# >>> Cuando existan informe_hollywood.Rmd e informe_hollywood.pdf,
# >>> vuelve a la terminal y sigue con lo de abajo.

# --- Commit 4: informe en R Markdown ---
git add informe_hollywood.Rmd
git commit -m "Agrega informe en R Markdown con preguntas 1, 2, 3, 4 y 7"

# --- Commit 5: informe en PDF ---
git add informe_hollywood.pdf
git commit -m "Agrega informe final en PDF"

# --- Commit 6: integrantes en el README ---
cat >> README.md << EOF

## Equipo

- $EQUIPO_1
- $EQUIPO_2
EOF

git add README.md
git commit -m "Actualiza README con integrantes del equipo"

git pull --rebase origin main
git push origin main


