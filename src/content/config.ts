import { defineCollection, reference, z } from "astro:content";
import { glob } from "astro/loaders";

// May also need to update /src/types/index.d.ts when updating this file
// When updating the set of searchable collections, update collectionList in /src/pages/search.astro

const searchable = z.object({
  title: z.string(),
  description: z.string().optional(),
  autodescription: z.boolean().default(true),
  draft: z.boolean().default(false),
});

const social = z.object({
  discord: z.string().optional(),
  email: z.string().optional(),
  facebook: z.string().optional(),
  github: z.string().optional(),
  instagram: z.string().optional(),
  linkedIn: z.string().optional(),
  pinterest: z.string().optional(),
  tiktok: z.string().optional(),
  website: z.string().optional(),
  youtube: z.string().optional(),
});

const ueber = defineCollection({
  loader: glob({ pattern: "-index.{md,mdx}", base: "./src/content/ueber" }),
  schema: ({ image }) =>
    searchable.extend({
      image: image().optional(),
      imageAlt: z.string().default(""),
    }),
});

const autoren = defineCollection({
  loader: glob({
    pattern: "**\/[^_]*.{md,mdx}",
    base: "./src/content/autoren",
  }),
  schema: ({ image }) =>
    searchable.extend({
      email: z.string().optional(),
      image: image().optional(),
      imageAlt: z.string().default(""),
      social: social.optional(),
    }),
});

const ankuendigungen = defineCollection({
  loader: glob({ pattern: "**\/[^_]*.{md,mdx}", base: "./src/content/ankuendigungen" }),
  schema: ({ image }) =>
    searchable.extend({
      date: z.date().optional(),
      image: image().optional(),
      imageAlt: z.string().default(""),
      author: reference("autoren").optional(),
      categories: z.array(z.string()).optional(),
      tags: z.array(z.string()).optional(),
      complexity: z.number().default(1),
      hideToc: z.boolean().default(false),
    }),
});

const materialien = defineCollection({
  loader: glob({ pattern: "**\/[^_]*.{md,mdx}", base: "./src/content/materialien" }),
  schema: ({ image }) =>
    searchable.extend({
      pubDate: z.date().optional(),
      modDate: z.date().optional(),
      image: image().optional(),
      imageAlt: z.string().default(""),
      hideToc: z.boolean().default(false),
      hideNav: z.boolean().default(false),
    }),
});

const home = defineCollection({
  loader: glob({ pattern: "-index.{md,mdx}", base: "./src/content/home" }),
  schema: ({ image }) =>
    z.object({
      image: image().optional(),
      imageAlt: z.string().default(""),
      title: z.string(),
      content: z.string(),
      button: z
        .object({
          label: z.string(),
          link: z.string().optional(),
        })
        .optional(),
    }),
});

const termine = defineCollection({
  loader: glob({
    pattern: "-index.{md,mdx}",
    base: "./src/content/termine",
  }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    cards: z.array(z.string()),
  }),
});

const ressourcen = defineCollection({
  loader: glob({ pattern: "**\/[^_]*.{md,mdx}", base: "./src/content/ressourcen" }),
  schema: ({ image }) =>
    searchable.extend({
      date: z.date().optional(),
      image: image().optional(),
      imageAlt: z.string().default(""),
      author: reference("autoren").optional(),
    }),
});

const projekte = defineCollection({
  loader: glob({
    pattern: "-index.{md,mdx}",
    base: "./src/content/projekte",
  }),
  schema: searchable.extend({
    projects: z.array(
      z.object({
        title: z.string(),
        github: z.string().optional(),
        technologies: z.array(z.string()).optional(),
        content: z.array(z.string()).optional(),
      }),
    ),
  }),
});

const wettbewerbe = defineCollection({
  loader: glob({
    pattern: "**\/[^_]*.{md,mdx}",
    base: "./src/content/wettbewerbe",
  }),
  schema: ({ image }) =>
    searchable.extend({
      date: z.date().optional(),
      image: image().optional(),
      imageAlt: z.string().default(""),
      author: reference("autoren").optional(),
      prepTime: z.number().optional(),
      servings: z.number().optional(),
      diet: z.string().optional(),
      ingredients: z
        .object({
          list: z.array(z.string()),
          qty: z.array(z.string()),
        })
        .optional(),
      instructions: z.array(z.string()).optional(),
      notes: z.array(z.string()).optional(),
    }),
});

const terms = defineCollection({
  loader: glob({ pattern: "-index.{md,mdx}", base: "./src/content/terms" }),
  schema: searchable,
});

// Export collections
export const collections = {
  ueber,
  autoren,
  ankuendigungen,
  materialien,
  termine,
  ressourcen,
  projekte,
  wettbewerbe,
  home,
  terms,
};
