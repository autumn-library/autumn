import { defineConfig } from 'vitepress'
import hljs from 'highlight.js';

// https://vitepress.dev/reference/site-config
export default defineConfig({

  appearance:'force-dark',
  markdown: {
    // https://github.com/markdown-it/markdown-it#syntax-highlighting
    highlight(str, lang, attrs) {
      if (lang && hljs.getLanguage(lang)) {
        try {
          return hljs.highlight(str, { language: lang }).value;
        } catch {}
      }

      return '';
    },
  },
  
  title: "Autumn Docs",
  description: "Это документация для Autumn - DIF для OS",
  lang: 'ru-RU',

  locales: {
    root: {
      label: 'Русский',
      lang: 'ru'
    },

  },

  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config

    logo: 'acorn-ol.png',

    nav: [
      { text: 'Главная', link: '/' },
      { text: 'Документация', link: '/docs/Getting-started/About-autumn.md' }
    ],

    sidebar: [
      {
        text: 'Начало работы',
        items: [
          { text: 'Что такое Autumn?', link: '/docs/Getting-started/About-autumn.md' },
          { text: 'Первое приложение', link: '/docs/Getting-started/First-steps.md' },
          { text: 'Дополнительные пакеты Autumn', link: '/docs/Getting-started/Additional-packages.md' },
        ]
      },
      {
        text: 'Использование фреймворка',
        items: [
          { text: 'Объявление компонента', link: '/docs/Framework-elements/Component-declaration.md' },
          { text: 'Получение экземпляра компонента', link: '/docs/Framework-elements/Component-instance.md' },
          { text: 'Связывание компонентов между собой', link: '/docs/Framework-elements/Components-binding.md' },
          { text: 'Фабрика компонентов', link: '/docs/Framework-elements/Components-factory.md' },
          { text: 'Внедрение зависимостей в поля и функции-сеттеры', link: '/docs/Framework-elements/Dependency-injection.md' },
          { text: 'Внедрение настроек приложения', link: '/docs/Framework-elements/App-settings-injection.md' },
          { text: 'Генератор экземпляров компонентов', link: '/docs/Framework-elements/Instance-generator.md' },
          { text: 'Произвольные аргументы конструктора', link: '/docs/Framework-elements/Custom-arguments.md' },
          { text: 'Алиасы компонентов', link: '/docs/Framework-elements/Aliaces.md' },
          { text: 'Упорядочивание компонентов при получении в виде сортированных коллекций', link: '/docs/Framework-elements/Components-sorting.md' },
          { text: 'Приоритизация компонентов с общим алиасом', link: '/docs/Framework-elements/Components-prioritization.md' },
          { text: 'Переопределение компонента по имени', link: '/docs/Framework-elements/Component-overriding.md' },
          { text: 'Пост-инициализация компонента', link: '/docs/Framework-elements/Component-post-initialization.md' },
          { text: 'Уникальность экземпляров компонентов', link: '/docs/Framework-elements/Component-uniqueness.md' },
          { text: 'Дополнительная обработка компонента', link: '/docs/Framework-elements/Additional-processing.md' },
          { text: 'Использование контекста приложения', link: '/docs/Framework-elements/App-context.md' },
          { text: 'Условная регистрация компонентов в контексте приложения', link: '/docs/Framework-elements/Conditional-registration.md' },
          { text: 'Инверсия управления запуском приложения', link: '/docs/Framework-elements/Launch-control-inversion.md' },
          { text: 'Собственные аннотации', link: '/docs/Framework-elements/Custom-annotations.md' },
          { text: 'Наследование аннотаций', link: '/docs/Framework-elements/Annotation-inheritance.md' },
          { text: 'Обработка аннотаций', link: '/docs/Framework-elements/Annotations-processing.md' },
          { text: 'Группировка компонентов по алиасу', link: '/docs/Framework-elements/Aliaces-grouping.md' },
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/autumn-library/autumn' }
   ]
  }
})
