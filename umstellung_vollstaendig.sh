#!/bin/bash

# Erstellen eines Backup des Projekts (falls noch nicht vorhanden)
if [ ! -d "/home/chris/Programming/mathelog_backup" ]; then
  echo "Erstelle Backup..."
  cp -r /home/chris/Programming/mathelog /home/chris/Programming/mathelog_backup
fi

# In den Projektordner wechseln
cd /home/chris/Programming/mathelog

# Definieren der Übersetzungen mit verschiedenen Schreibweisen
declare -A translations=(
  ["blog"]="ankuendigungen"
  ["Blog"]="Ankündigungen"
  ["BLOG"]="ANKÜNDIGUNGEN"
  ["docs"]="materialien"
  ["Docs"]="Materialien"
  ["DOCS"]="MATERIALIEN"
  ["recipes"]="wettbewerbe"
  ["Recipes"]="Wettbewerbe"
  ["RECIPES"]="WETTBEWERBE"
  ["poetry"]="ressourcen"
  ["Poetry"]="Ressourcen"
  ["POETRY"]="RESSOURCEN"
  ["index-cards"]="termine"
  ["Index Cards"]="Termine"
  ["Index-Cards"]="Termine"
  ["IndexCards"]="Termine"
  ["indexCards"]="termine"
  ["INDEX_CARDS"]="TERMINE"
  ["authors"]="autoren"
  ["Authors"]="Autoren"
  ["AUTHORS"]="AUTOREN"
  ["about"]="ueber"
  ["About"]="Über"
  ["ABOUT"]="ÜBER"
  ["portfolio"]="projekte"
  ["Portfolio"]="Projekte"
  ["PORTFOLIO"]="PROJEKTE"
)

# 1. Inhaltsverzeichnisse umbenennen
echo "Benenne Inhaltsverzeichnisse um..."
if [ -d "src/content/blog" ] && [ ! -d "src/content/ankuendigungen" ]; then
  mv "src/content/blog" "src/content/ankuendigungen"
  echo "Umbenannt: src/content/blog -> src/content/ankuendigungen"
fi

if [ -d "src/content/docs" ] && [ ! -d "src/content/materialien" ]; then
  mv "src/content/docs" "src/content/materialien"
  echo "Umbenannt: src/content/docs -> src/content/materialien"
fi

if [ -d "src/content/recipes" ] && [ ! -d "src/content/wettbewerbe" ]; then
  mv "src/content/recipes" "src/content/wettbewerbe"
  echo "Umbenannt: src/content/recipes -> src/content/wettbewerbe"
fi

if [ -d "src/content/poetry" ] && [ ! -d "src/content/ressourcen" ]; then
  mv "src/content/poetry" "src/content/ressourcen"
  echo "Umbenannt: src/content/poetry -> src/content/ressourcen"
fi

if [ -d "src/content/index-cards" ] && [ ! -d "src/content/termine" ]; then
  mv "src/content/index-cards" "src/content/termine"
  echo "Umbenannt: src/content/index-cards -> src/content/termine"
fi

if [ -d "src/content/authors" ] && [ ! -d "src/content/autoren" ]; then
  mv "src/content/authors" "src/content/autoren"
  echo "Umbenannt: src/content/authors -> src/content/autoren"
fi

if [ -d "src/content/about" ] && [ ! -d "src/content/ueber" ]; then
  mv "src/content/about" "src/content/ueber"
  echo "Umbenannt: src/content/about -> src/content/ueber"
fi

if [ -d "src/content/portfolio" ] && [ ! -d "src/content/projekte" ]; then
  mv "src/content/portfolio" "src/content/projekte"
  echo "Umbenannt: src/content/portfolio -> src/content/projekte"
fi

# 2. Komponentenverzeichnisse umbenennen
echo "Benenne Komponentenverzeichnisse um..."
if [ -d "src/components/blog" ] && [ ! -d "src/components/ankuendigungen" ]; then
  mv "src/components/blog" "src/components/ankuendigungen"
  echo "Umbenannt: src/components/blog -> src/components/ankuendigungen"
fi

if [ -d "src/components/docs" ] && [ ! -d "src/components/materialien" ]; then
  mv "src/components/docs" "src/components/materialien"
  echo "Umbenannt: src/components/docs -> src/components/materialien"
fi

if [ -d "src/components/recipes" ] && [ ! -d "src/components/wettbewerbe" ]; then
  mv "src/components/recipes" "src/components/wettbewerbe"
  echo "Umbenannt: src/components/recipes -> src/components/wettbewerbe"
fi

if [ -d "src/components/poetry" ] && [ ! -d "src/components/ressourcen" ]; then
  mv "src/components/poetry" "src/components/ressourcen"
  echo "Umbenannt: src/components/poetry -> src/components/ressourcen"
fi

if [ -d "src/components/index-cards" ] && [ ! -d "src/components/termine" ]; then
  mv "src/components/index-cards" "src/components/termine"
  echo "Umbenannt: src/components/index-cards -> src/components/termine"
fi

if [ -d "src/components/authors" ] && [ ! -d "src/components/autoren" ]; then
  mv "src/components/authors" "src/components/autoren"
  echo "Umbenannt: src/components/authors -> src/components/autoren"
fi

if [ -d "src/components/about" ] && [ ! -d "src/components/ueber" ]; then
  mv "src/components/about" "src/components/ueber"
  echo "Umbenannt: src/components/about -> src/components/ueber"
fi

if [ -d "src/components/portfolio" ] && [ ! -d "src/components/projekte" ]; then
  mv "src/components/portfolio" "src/components/projekte"
  echo "Umbenannt: src/components/portfolio -> src/components/projekte"
fi

# 3. Seitendateien umbenennen
echo "Benenne Seitendateien um..."
for dir in src/pages/*; do
  if [ -d "$dir" ]; then
    base=$(basename "$dir")
    case "$base" in
      "blog")
        if [ ! -d "src/pages/ankuendigungen" ]; then
          mv "$dir" "src/pages/ankuendigungen"
          echo "Umbenannt: $dir -> src/pages/ankuendigungen"
        fi
        ;;
      "docs")
        if [ ! -d "src/pages/materialien" ]; then
          mv "$dir" "src/pages/materialien"
          echo "Umbenannt: $dir -> src/pages/materialien"
        fi
        ;;
      "recipes")
        if [ ! -d "src/pages/wettbewerbe" ]; then
          mv "$dir" "src/pages/wettbewerbe"
          echo "Umbenannt: $dir -> src/pages/wettbewerbe"
        fi
        ;;
      "poetry")
        if [ ! -d "src/pages/ressourcen" ]; then
          mv "$dir" "src/pages/ressourcen"
          echo "Umbenannt: $dir -> src/pages/ressourcen"
        fi
        ;;
      "index-cards")
        if [ ! -d "src/pages/termine" ]; then
          mv "$dir" "src/pages/termine"
          echo "Umbenannt: $dir -> src/pages/termine"
        fi
        ;;
      "authors")
        if [ ! -d "src/pages/autoren" ]; then
          mv "$dir" "src/pages/autoren"
          echo "Umbenannt: $dir -> src/pages/autoren"
        fi
        ;;
      "about")
        if [ ! -d "src/pages/ueber" ]; then
          mv "$dir" "src/pages/ueber"
          echo "Umbenannt: $dir -> src/pages/ueber"
        fi
        ;;
      "portfolio")
        if [ ! -d "src/pages/projekte" ]; then
          mv "$dir" "src/pages/projekte"
          echo "Umbenannt: $dir -> src/pages/projekte"
        fi
        ;;
    esac
  fi
done

# Einzelne Dateien umbenennen
if [ -f "src/pages/about.astro" ] && [ ! -f "src/pages/ueber.astro" ]; then
  mv "src/pages/about.astro" "src/pages/ueber.astro"
  echo "Umbenannt: src/pages/about.astro -> src/pages/ueber.astro"
fi

if [ -f "src/pages/portfolio.astro" ] && [ ! -f "src/pages/projekte.astro" ]; then
  mv "src/pages/portfolio.astro" "src/pages/projekte.astro"
  echo "Umbenannt: src/pages/portfolio.astro -> src/pages/projekte.astro"
fi

if [ -f "src/pages/index-cards.astro" ] && [ ! -f "src/pages/termine.astro" ]; then
  mv "src/pages/index-cards.astro" "src/pages/termine.astro"
  echo "Umbenannt: src/pages/index-cards.astro -> src/pages/termine.astro"
fi

# 4. Assets umbenennen
echo "Benenne Assets-Verzeichnisse um..."
for dir in src/assets/*; do
  if [ -d "$dir" ]; then
    base=$(basename "$dir")
    case "$base" in
      "blog")
        mkdir -p "src/assets/ankuendigungen"
        cp -r "$dir"/* "src/assets/ankuendigungen/"
        rm -rf "$dir"
        echo "Verschoben: $dir -> src/assets/ankuendigungen"
        ;;
      "docs")
        mkdir -p "src/assets/materialien"
        cp -r "$dir"/* "src/assets/materialien/"
        rm -rf "$dir"
        echo "Verschoben: $dir -> src/assets/materialien"
        ;;
      "recipes")
        mkdir -p "src/assets/wettbewerbe"
        cp -r "$dir"/* "src/assets/wettbewerbe/"
        rm -rf "$dir"
        echo "Verschoben: $dir -> src/assets/wettbewerbe"
        ;;
      "poetry")
        mkdir -p "src/assets/ressourcen"
        cp -r "$dir"/* "src/assets/ressourcen/"
        rm -rf "$dir"
        echo "Verschoben: $dir -> src/assets/ressourcen"
        ;;
      "index-cards")
        mkdir -p "src/assets/termine"
        cp -r "$dir"/* "src/assets/termine/"
        rm -rf "$dir"
        echo "Verschoben: $dir -> src/assets/termine"
        ;;
      "authors")
        mkdir -p "src/assets/autoren"
        cp -r "$dir"/* "src/assets/autoren/"
        rm -rf "$dir"
        echo "Verschoben: $dir -> src/assets/autoren"
        ;;
      "about")
        mkdir -p "src/assets/ueber"
        cp -r "$dir"/* "src/assets/ueber/"
        rm -rf "$dir"
        echo "Verschoben: $dir -> src/assets/ueber"
        ;;
      "portfolio")
        mkdir -p "src/assets/projekte"
        cp -r "$dir"/* "src/assets/projekte/"
        rm -rf "$dir"
        echo "Verschoben: $dir -> src/assets/projekte"
        ;;
    esac
  fi
done

# 5. Aktualisieren aller Referenzen in den Dateien
echo "Aktualisiere Referenzen in Dateien..."

# Finde alle Dateien (umfassendere Suche)
file_list=$(find src -type f | grep -v "node_modules")

# Bearbeite speziell die Header-Datei für Menü-Einträge
if [ -f "src/components/base/Header.astro" ]; then
  echo "Aktualisiere die Menünamen in Header.astro..."
  sed -i 's/{name: "Blog",/{name: "Ankündigungen",/g' "src/components/base/Header.astro"
  sed -i 's/{name: "Docs",/{name: "Materialien",/g' "src/components/base/Header.astro"
  sed -i 's/{name: "Recipes",/{name: "Wettbewerbe",/g' "src/components/base/Header.astro"
  sed -i 's/{name: "Poetry",/{name: "Ressourcen",/g' "src/components/base/Header.astro"
  sed -i 's/{name: "Index Cards",/{name: "Termine",/g' "src/components/base/Header.astro"
  sed -i 's/{name: "Authors",/{name: "Autoren",/g' "src/components/base/Header.astro"
  sed -i 's/{name: "About",/{name: "Über",/g' "src/components/base/Header.astro"
  sed -i 's/{name: "Portfolio",/{name: "Projekte",/g' "src/components/base/Header.astro"
fi

# Ersetze alle Referenzen in allen Dateien
for old_term in "${!translations[@]}"; do
  new_term=${translations[$old_term]}
  echo "Ersetze: $old_term -> $new_term"
  
  # Ersetze in allen Dateien
  for file in $file_list; do
    if [ -f "$file" ]; then
      sed -i "s|$old_term|$new_term|g" "$file"
    fi
  done
done

# 6. Aktualisiere die Typen-Definitionen
echo "Aktualisiere Typen-Definitionen..."
if [ -f "src/types/index.d.ts" ]; then
  sed -i 's/interface BlogEntry/interface AnkuendigungenEntry/g' "src/types/index.d.ts"
  sed -i 's/interface DocsEntry/interface MaterialienEntry/g' "src/types/index.d.ts"
  sed -i 's/interface RecipesEntry/interface WettbewerbeEntry/g' "src/types/index.d.ts"
  sed -i 's/interface PoetryEntry/interface RessourcenEntry/g' "src/types/index.d.ts"
  sed -i 's/interface IndexCardsEntry/interface TermineEntry/g' "src/types/index.d.ts"
  sed -i 's/interface AuthorsEntry/interface AutorenEntry/g' "src/types/index.d.ts"
  sed -i 's/interface AboutEntry/interface UeberEntry/g' "src/types/index.d.ts"
  sed -i 's/interface PortfolioEntry/interface ProjekteEntry/g' "src/types/index.d.ts"
  
  # Aktualisiere Union-Typen
  sed -i 's/type SearchableEntry = BlogEntry | DocsEntry/type SearchableEntry = AnkuendigungenEntry | MaterialienEntry/g' "src/types/index.d.ts"
  sed -i 's/| RecipesEntry | PoetryEntry/| WettbewerbeEntry | RessourcenEntry/g' "src/types/index.d.ts"
  sed -i 's/| IndexCardsEntry | AboutEntry | PortfolioEntry;/| TermineEntry | UeberEntry | ProjekteEntry;/g' "src/types/index.d.ts"
  
  echo "Typen-Definitionen aktualisiert!"
fi

# 7. Aktualisiere die content/config.ts
echo "Aktualisiere Content-Konfiguration..."
if [ -f "src/content/config.ts" ]; then
  sed -i 's/const blog = defineCollection/const ankuendigungen = defineCollection/g' "src/content/config.ts"
  sed -i 's/const docs = defineCollection/const materialien = defineCollection/g' "src/content/config.ts"
  sed -i 's/const recipes = defineCollection/const wettbewerbe = defineCollection/g' "src/content/config.ts"
  sed -i 's/const poetry = defineCollection/const ressourcen = defineCollection/g' "src/content/config.ts"
  sed -i 's/const indexCards = defineCollection/const termine = defineCollection/g' "src/content/config.ts"
  sed -i 's/const authors = defineCollection/const autoren = defineCollection/g' "src/content/config.ts"
  sed -i 's/const about = defineCollection/const ueber = defineCollection/g' "src/content/config.ts"
  sed -i 's/const portfolio = defineCollection/const projekte = defineCollection/g' "src/content/config.ts"
  
  # Entferne alte Exporte (wenn noch vorhanden)
  sed -i '/^\s*about,$/d; /^\s*authors,$/d; /^\s*blog,$/d; /^\s*docs,$/d; /^\s*indexCards,$/d; /^\s*poetry,$/d; /^\s*portfolio,$/d; /^\s*recipes,$/d;' "src/content/config.ts"
  
  # Überprüfe, ob die neuen Exporte bereits hinzugefügt wurden
  if ! grep -q "ueber," "src/content/config.ts"; then
    # Neue Exporte hinzufügen
    sed -i 's/export const collections = {/export const collections = {\n  ueber,\n  autoren,\n  ankuendigungen,\n  materialien,\n  termine,\n  ressourcen,\n  projekte,\n  wettbewerbe,/g' "src/content/config.ts"
  fi
fi

# 8. Aktualisiere die Suchseite
echo "Aktualisiere Suchseite..."
find src/pages -name "search.astro" -exec sed -i "s|const searchableCollections = \[.*\];|const searchableCollections = [\"ankuendigungen\", \"materialien\", \"wettbewerbe\", \"ressourcen\", \"termine\", \"ueber\", \"projekte\"];|g" {} \;

# 9. Aktualisiere BaseLayout für Seitentitel
if [ -f "src/components/base/BaseLayout.astro" ]; then
  echo "Aktualisiere BaseLayout für Seitentitel..."
  sed -i 's/const siteTitle = "Astrogon";/const siteTitle = "Mathelog";/g' "src/components/base/BaseLayout.astro"
  sed -i 's/const siteDescription = "Astrogon is a simple and elegant Astro theme.";/const siteDescription = "Mathelog ist eine Plattform für mathematische Wettbewerbe und Ressourcen.";/g' "src/components/base/BaseLayout.astro"
  sed -i 's/const siteAuthor = "Jane Doe";/const siteAuthor = "Mathelog Team";/g' "src/components/base/BaseLayout.astro"
  sed -i 's|const baseUrl = "https://janedoe.com";|const baseUrl = "https://mathelog.de";|g' "src/components/base/BaseLayout.astro"
fi

# 10. Aktualisiere die Seitennavigation in Komponenten
echo "Aktualisiere die Seitennavigation..."
find src/components -name "*.astro" -exec sed -i 's|"/blog/|"/ankuendigungen/|g; s|"/docs/|"/materialien/|g; s|"/recipes/|"/wettbewerbe/|g; s|"/poetry/|"/ressourcen/|g; s|"/index-cards/|"/termine/|g; s|"/authors/|"/autoren/|g; s|"/about/|"/ueber/|g; s|"/portfolio/|"/projekte/|g' {} \;

# 11. Aktualisiere Import-Pfade
echo "Aktualisiere Import-Pfade..."
for file in $file_list; do
  if [ -f "$file" ]; then
    sed -i 's|import .* from "@components/blog/|import * from "@components/ankuendigungen/|g' "$file"
    sed -i 's|import .* from "@components/docs/|import * from "@components/materialien/|g' "$file"
    sed -i 's|import .* from "@components/recipes/|import * from "@components/wettbewerbe/|g' "$file"
    sed -i 's|import .* from "@components/poetry/|import * from "@components/ressourcen/|g' "$file"
    sed -i 's|import .* from "@components/index-cards/|import * from "@components/termine/|g' "$file"
    sed -i 's|import .* from "@components/authors/|import * from "@components/autoren/|g' "$file"
    sed -i 's|import .* from "@components/about/|import * from "@components/ueber/|g' "$file"
    sed -i 's|import .* from "@components/portfolio/|import * from "@components/projekte/|g' "$file"
  fi
done

echo "==============================================="
echo "Umfassende Umstellung abgeschlossen!"
echo "Bitte überprüfen Sie das Projekt und führen Sie 'npm run build' aus, um sicherzustellen, dass alles korrekt funktioniert."
echo "==============================================="
