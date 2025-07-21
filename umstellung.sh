#!/bin/bash

# Erstellen eines Backup des Projekts
echo "Erstelle Backup..."
cp -r /home/chris/Programming/mathelog /home/chris/Programming/mathelog_backup

# In den Projektordner wechseln
cd /home/chris/Programming/mathelog

# Definieren der Übersetzungen
declare -A translations=(
  ["blog"]="ankuendigungen"
  ["docs"]="materialien"
  ["recipes"]="wettbewerbe"
  ["poetry"]="ressourcen"
  ["index-cards"]="termine"
  ["authors"]="autoren"
  ["about"]="ueber"
  ["portfolio"]="projekte"
)

declare -A capitalized_translations=(
  ["Blog"]="Ankündigungen"
  ["Docs"]="Materialien"
  ["Recipes"]="Wettbewerbe"
  ["Poetry"]="Ressourcen"
  ["Index Cards"]="Termine"
  ["IndexCards"]="Termine"
  ["Authors"]="Autoren"
  ["About"]="Über"
  ["Portfolio"]="Projekte"
)

# 1. Inhaltsverzeichnisse umbenennen
echo "Benenne Inhaltsverzeichnisse um..."
for old_name in "${!translations[@]}"; do
  new_name=${translations[$old_name]}
  if [ -d "src/content/$old_name" ]; then
    mv "src/content/$old_name" "src/content/$new_name"
    echo "Umbenannt: src/content/$old_name -> src/content/$new_name"
  else
    echo "Verzeichnis src/content/$old_name nicht gefunden."
  fi
done

# 2. Komponentenverzeichnisse umbenennen
echo "Benenne Komponentenverzeichnisse um..."
for old_name in "${!translations[@]}"; do
  new_name=${translations[$old_name]}
  if [ -d "src/components/$old_name" ]; then
    mv "src/components/$old_name" "src/components/$new_name"
    echo "Umbenannt: src/components/$old_name -> src/components/$new_name"
  else
    echo "Verzeichnis src/components/$old_name nicht gefunden."
  fi
done

# 3. Seitendateien umbenennen
echo "Benenne Seitendateien um..."
for old_name in "${!translations[@]}"; do
  new_name=${translations[$old_name]}
  
  # Für Verzeichnisse
  if [ -d "src/pages/$old_name" ]; then
    mv "src/pages/$old_name" "src/pages/$new_name"
    echo "Umbenannt: src/pages/$old_name -> src/pages/$new_name"
  # Für einzelne Dateien
  elif [ -f "src/pages/$old_name.astro" ]; then
    mv "src/pages/$old_name.astro" "src/pages/$new_name.astro"
    echo "Umbenannt: src/pages/$old_name.astro -> src/pages/$new_name.astro"
  else
    echo "Seite src/pages/$old_name nicht gefunden."
  fi
done

# 4. Assets umbenennen
echo "Benenne Assets-Verzeichnisse um..."
for old_name in "${!translations[@]}"; do
  new_name=${translations[$old_name]}
  
  # Erstelle das neue Verzeichnis
  mkdir -p "src/assets/$new_name"
  
  # Kopiere Inhalte, falls vorhanden
  if [ -d "src/assets/$old_name" ]; then
    cp -r "src/assets/$old_name"/* "src/assets/$new_name/"
    rm -rf "src/assets/$old_name"
    echo "Verschoben: src/assets/$old_name -> src/assets/$new_name"
  else
    echo "Verzeichnis src/assets/$old_name nicht gefunden."
  fi
done

# 5. Aktualisieren aller Referenzen in den Dateien
echo "Aktualisiere Referenzen in Dateien..."

# Finde alle relevanten Dateien
file_list=$(find src -type f \( -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" -o -name "*.astro" -o -name "*.md" -o -name "*.mdx" -o -name "*.scss" -o -name "*.css" \))

# Ersetze Referenzen
for old_name in "${!translations[@]}"; do
  new_name=${translations[$old_name]}
  cap_old=${capitalized_translations[$old_name]}
  cap_new=${capitalized_translations[$old_name]}
  
  echo "Ersetze: $old_name -> $new_name"
  echo "Ersetze: $cap_old -> $cap_new"
  
  # Ersetze in allen Dateien
  for file in $file_list; do
    # Ersetze kleingeschriebene Varianten
    sed -i "s|$old_name|$new_name|g" "$file"
    
    # Ersetze großgeschriebene Varianten
    if [[ -n "$cap_old" && -n "$cap_new" ]]; then
      sed -i "s|$cap_old|$cap_new|g" "$file"
    fi
  done
  
  # Ersetze in Pfaden und Importanweisungen
  sed -i "s|@components/$old_name|@components/$new_name|g" $file_list
  sed -i "s|from \"../$old_name/|from \"../$new_name/|g" $file_list
  sed -i "s|\"./$old_name/|\"./$new_name/|g" $file_list
  sed -i "s|\"/$old_name/|\"/$new_name/|g" $file_list
done

# 6. Aktualisiere die IndexCards-Referenzen explizit
echo "Aktualisiere IndexCards-Referenzen..."
sed -i "s|IndexCards|Termine|g" $file_list
sed -i "s|indexCards|termine|g" $file_list

# 7. Aktualisiere die Typen-Definitionen
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
else
  echo "Datei src/types/index.d.ts nicht gefunden."
fi

# 8. Aktualisiere die content/config.ts
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
  
  # Aktualisiere die Export-Anweisung - erst entfernen, dann neu hinzufügen
  sed -i '/^  about,$/d; /^  authors,$/d; /^  blog,$/d; /^  docs,$/d; /^  indexCards,$/d; /^  poetry,$/d; /^  portfolio,$/d; /^  recipes,$/d;' "src/content/config.ts"
  
  # Neue Exporte hinzufügen
  sed -i 's/export const collections = {/export const collections = {\n  ueber,\n  autoren,\n  ankuendigungen,\n  materialien,\n  termine,\n  ressourcen,\n  projekte,\n  wettbewerbe,/g' "src/content/config.ts"
  
  echo "Content-Konfiguration aktualisiert!"
else
  echo "Datei src/content/config.ts nicht gefunden."
fi

# 9. Aktualisiere die Header-Navigation
echo "Aktualisiere Header-Navigation..."
if [ -f "src/components/base/Header.astro" ]; then
  sed -i 's/{text: "Blog", link: "\/blog\/"}/{text: "Ankündigungen", link: "\/ankuendigungen\/"}/g' "src/components/base/Header.astro"
  sed -i 's/{text: "Docs", link: "\/docs\/"}/{text: "Materialien", link: "\/materialien\/"}/g' "src/components/base/Header.astro"
  sed -i 's/{text: "Recipes", link: "\/recipes\/"}/{text: "Wettbewerbe", link: "\/wettbewerbe\/"}/g' "src/components/base/Header.astro"
  sed -i 's/{text: "Poetry", link: "\/poetry\/"}/{text: "Ressourcen", link: "\/ressourcen\/"}/g' "src/components/base/Header.astro"
  sed -i 's/{text: "Index Cards", link: "\/index-cards\/"}/{text: "Termine", link: "\/termine\/"}/g' "src/components/base/Header.astro"
  sed -i 's/{text: "About", link: "\/about\/"}/{text: "Über", link: "\/ueber\/"}/g' "src/components/base/Header.astro"
  sed -i 's/{text: "Portfolio", link: "\/portfolio\/"}/{text: "Projekte", link: "\/projekte\/"}/g' "src/components/base/Header.astro"
  
  echo "Header-Navigation aktualisiert!"
else
  echo "Datei src/components/base/Header.astro nicht gefunden."
fi

# 10. Aktualisiere die Suchseite
echo "Aktualisiere Suchseite..."
find src/pages -name "search.astro" -exec sed -i "s|const searchableCollections = \[.*\];|const searchableCollections = [\"ankuendigungen\", \"materialien\", \"wettbewerbe\", \"ressourcen\", \"termine\", \"ueber\", \"projekte\"];|g" {} \;

echo "==============================================="
echo "Umstellung abgeschlossen!"
echo "Bitte überprüfen Sie das Projekt und führen Sie 'npm run build' aus, um sicherzustellen, dass alles korrekt funktioniert."
echo "==============================================="
