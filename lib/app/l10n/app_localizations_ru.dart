// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get app_name => 'Алора';

  @override
  String get common_retry => 'Повторить';

  @override
  String get common_cancel => 'Отмена';

  @override
  String get common_save => 'Сохранить';

  @override
  String get common_ok => 'ОК';

  @override
  String get common_loading => 'Загрузка…';

  @override
  String get common_noInternet => 'Нет интернета. Будет отправлено при восстановлении';

  @override
  String get common_error => 'Произошла ошибка';

  @override
  String get common_search => 'Поиск';

  @override
  String get common_close => 'Закрыть';

  @override
  String get error_network => 'Нет подключения к интернету.';

  @override
  String get error_auth => 'Сессия истекла. Пожалуйста, войдите снова.';

  @override
  String get offline_flushFailed =>
      'На сервере есть новые данные. Некоторые изменения не сохранены.';

  @override
  String get error_permission => 'Нет доступа';

  @override
  String get error_notFound => 'Не найдено';

  @override
  String get error_limit => 'Лимит исчерпан';

  @override
  String get orders_confirm => 'Подтвердить';

  @override
  String get orders_confirmedSnack => 'Заказ подтверждён';

  @override
  String get orders_createdSnack => 'Заказ создан';

  @override
  String get chat_defaultTitle => 'Клиент';

  @override
  String get chat_historyLoadFailedTitle => 'Данные не загружены';

  @override
  String get chat_noConversation => 'Беседа не выбрана';

  @override
  String get limit_callManager => 'Позвонить';

  @override
  String get limit_smsManager => 'SMS';

  @override
  String get error_serviceUnavailable => 'AI сервис временно недоступен';

  @override
  String get error_server => 'Сервер не отвечает';

  @override
  String get error_unknown => 'Неизвестная ошибка';

  @override
  String get order_status_draft => 'Черновик';

  @override
  String get order_status_confirmed => 'Подтвержден';

  @override
  String get order_status_measuring => 'На замере';

  @override
  String get order_status_production => 'В пошиве';

  @override
  String get order_status_ready => 'Готов';

  @override
  String get order_status_installing => 'На установке';

  @override
  String get order_status_completed => 'Сдан';

  @override
  String get order_status_cancelled => 'Отменен';

  @override
  String get order_status_unknown => 'Неизвестно';

  @override
  String get payment_status_advancePaid => 'Аванс получен';

  @override
  String get payment_status_fullyPaid => 'Оплачен полностью';

  @override
  String get payment_status_debt => 'Есть долг';

  @override
  String get payment_status_unknown => 'Неизвестно';

  @override
  String get price_unit_perSqm => 'сум/м²';

  @override
  String get price_unit_perPiece => 'сум/шт';

  @override
  String get price_unit_perMeter => 'сум/м';

  @override
  String get price_unit_unknown => '';

  @override
  String get login_tagline => 'Инструмент для работы со шторами';

  @override
  String get login_phoneLabel => 'Номер телефона';

  @override
  String get login_passwordLabel => 'Пароль';

  @override
  String get login_signIn => 'Войти';

  @override
  String get login_forgotPassword => 'Забыли пароль? Обратитесь к менеджеру';

  @override
  String get login_errorAuthFailed => 'Неверные данные для входа';

  @override
  String get login_errorRequired => 'Введите номер телефона и пароль';

  @override
  String get tab_chat => 'Чаты';

  @override
  String get tab_orders => 'Заказы';

  @override
  String get tab_catalog => 'Каталог';

  @override
  String get tab_management => 'Управление';

  @override
  String get tab_profile => 'Профиль';

  @override
  String get placeholder_comingSoon => 'Раздел готовится';

  @override
  String get forbidden_title => 'Нет доступа';

  @override
  String get forbidden_text => 'В этот раздел могут входить только менеджер или администратор';

  @override
  String get catalog_searchHint => 'Поиск товаров';

  @override
  String get catalog_allCategories => 'Все';

  @override
  String get catalog_filter => 'Фильтры';

  @override
  String get catalog_filterClear => 'Сбросить';

  @override
  String catalog_filterShow(int count) {
    return 'Показать ($count шт)';
  }

  @override
  String get catalog_emptyTitle => 'Ничего не найдено';

  @override
  String get catalog_emptyMessage => 'Измените фильтры или поисковый запрос';

  @override
  String get catalog_filterType => 'Тип';

  @override
  String get catalog_filterTypeFabric => 'Ткани';

  @override
  String get catalog_filterTypeAccessory => 'Аксессуары';

  @override
  String get catalog_filterStyle => 'Стиль';

  @override
  String get catalog_filterStyleKlassik => 'Классический';

  @override
  String get catalog_filterStyleZamonaviy => 'Современный';

  @override
  String get catalog_filterStyleMinimalist => 'Минималистичный';

  @override
  String get catalog_filterRoom => 'Комната';

  @override
  String get catalog_filterRoomMehmonxona => 'Гостиная';

  @override
  String get catalog_filterRoomYotoqxona => 'Спальня';

  @override
  String get catalog_filterRoomOshxona => 'Кухня';

  @override
  String get catalog_filterRoomBolalarXonasi => 'Детская';

  @override
  String get catalog_filterRoomOfis => 'Офис';

  @override
  String get catalog_filterPattern => 'Узор';

  @override
  String get catalog_filterPatternYassi => 'Гладкий';

  @override
  String get catalog_filterPatternGulli => 'Цветочный';

  @override
  String get catalog_filterPatternChiziqli => 'Полосатый';

  @override
  String get catalog_filterPatternGeometrik => 'Геометрический';

  @override
  String get catalog_filterTransparency => 'Прозрачность';

  @override
  String get catalog_filterTransparencyYopiq => 'Непрозрачный';

  @override
  String get catalog_filterTransparencyYarimYorug => 'Полупрозрачный';

  @override
  String get catalog_filterTransparencyYorug => 'Прозрачный';

  @override
  String get catalog_filterSegment => 'Сегмент';

  @override
  String get catalog_filterSegmentEconomy => 'Эконом';

  @override
  String get catalog_filterSegmentStandard => 'Стандарт';

  @override
  String get catalog_filterSegmentPremium => 'Премиум';

  @override
  String get catalog_filterPrice => 'Цена';

  @override
  String catalog_filterPriceRange(int min, int max) {
    return '$min — $max сум';
  }

  @override
  String catalog_filterPriceRangeFormatted(String min, String max) {
    return '$min — $max сум';
  }

  @override
  String get product_category => 'Категория';

  @override
  String get product_properties => 'Характеристики';

  @override
  String get product_askAi => 'Спросить у AI';

  @override
  String get product_addToAccount => 'Добавить в расчёт';

  @override
  String get product_variantSelected => 'Выбран';

  @override
  String get product_colorLabel => 'Цвет';

  @override
  String product_rollWidthValue(String value, String unit) {
    return '$value $unit';
  }

  @override
  String get product_fabricType => 'Тип ткани';

  @override
  String get product_rollWidth => 'Ширина рулона';

  @override
  String get product_composition => 'Состав';

  @override
  String get product_care => 'Уход';

  @override
  String get product_unitCm => 'см';

  @override
  String get product_sewingRequired => 'Нужен пошив';

  @override
  String product_askAiMessage(String name, String color) {
    return 'Подходит ли эта ткань ($name, $color) для гостиной?';
  }

  @override
  String product_addToAccountMessage(String variant) {
    return 'Добавить в расчёт: $variant';
  }

  @override
  String get conversations_title => 'Чаты';

  @override
  String get conversations_searchHint => 'Чат или клиент';

  @override
  String get conversations_filterAll => 'Все';

  @override
  String get conversations_filterHasOrder => 'С выставленным счётом';

  @override
  String get conversations_filterInProgress => 'Незавершённые';

  @override
  String get conversations_stageNeed => 'потребность';

  @override
  String get conversations_stageRecommend => 'рекомендация';

  @override
  String get conversations_stageMeasure => 'замер';

  @override
  String get conversations_stageCalc => 'расчёт';

  @override
  String get conversations_stageVariants => 'варианты';

  @override
  String get conversations_stageOrder => 'заказ';

  @override
  String get conversations_stageUnknown => 'неизвестно';

  @override
  String get conversations_groupToday => 'Сегодня';

  @override
  String get conversations_groupYesterday => 'Вчера';

  @override
  String get conversations_groupThisWeek => 'На этой неделе';

  @override
  String get conversations_groupOlder => 'Ранее';

  @override
  String get conversations_new => 'Новый чат';

  @override
  String get conversations_emptyTitle => 'Чатов пока нет';

  @override
  String get conversations_emptyMessage => 'Начните новый чат';

  @override
  String get conversations_emptyFilteredTitle => 'Ничего не найдено';

  @override
  String get conversations_emptyFilteredMessage => 'Измените фильтры';

  @override
  String get conversations_archive => 'В архив';

  @override
  String get conversations_archiveDialogTitle => 'Архивировать чат?';

  @override
  String get conversations_archiveDialogMessage => 'Чат будет перемещён в архив';

  @override
  String get chat_emptyTitle => 'Что ищет клиент?';

  @override
  String get chat_start_livingRoom => 'Гостиная';

  @override
  String get chat_start_bedroom => 'Спальня';

  @override
  String get chat_start_couple => 'Комната молодоженов';

  @override
  String get chat_start_kitchen => 'Кухня';

  @override
  String get chat_start_kids => 'Детская';

  @override
  String get chat_start_office => 'Офис';

  @override
  String get chat_thinking => 'Думает…';

  @override
  String chat_tool_running(String tool) {
    return '$tool…';
  }

  @override
  String get chat_tool_result => 'Результат';

  @override
  String get chat_inputHint => 'Сообщение…';

  @override
  String get chat_newMessages => '↓ Новое сообщение';

  @override
  String get chat_menuNew => 'Новый чат';

  @override
  String get chat_menuReset => 'Очистить чат';

  @override
  String get chat_menuCustomerMode => 'Режим клиента';

  @override
  String get chat_menuPdf => 'PDF предложение';

  @override
  String get chat_menuShare => 'Поделиться';

  @override
  String get chat_resetConfirmTitle => 'Очистить?';

  @override
  String get chat_resetConfirmMessage => 'Контекст будет удален.';

  @override
  String get chat_continue => 'Продолжить';

  @override
  String get chat_retry => 'Повторить';

  @override
  String get tool_label_product_search => 'Поиск продукта';

  @override
  String get tool_label_curtain_calculate => 'Вычисление';

  @override
  String get tool_label_price_quote => 'Оценка';

  @override
  String get tool_label_order_draft => 'Черновик заказа';

  @override
  String get tool_label_variants => 'Подготовка вариантов';

  @override
  String get tool_label_unknown => 'Получение данных';

  @override
  String get chat_quote_fabrics => 'Ткани';

  @override
  String get chat_quote_accessories => 'Аксессуары';

  @override
  String get chat_quote_services => 'Услуги';

  @override
  String chat_quote_more(int count) {
    return 'Еще $count частей';
  }

  @override
  String get chat_quote_total => 'Итого';

  @override
  String get chat_quote_howCalculated => 'Как рассчитано?';

  @override
  String get chat_quote_close => 'Закрыть';

  @override
  String get chat_quote_show => 'Смотреть';

  @override
  String get chat_quote_addPart => 'Добавить часть';

  @override
  String get chat_quote_showOptions => 'Варианты';

  @override
  String get chat_options_select => 'Выбрать';

  @override
  String get chat_draft_edit => 'Редактировать';

  @override
  String get chat_draft_createOrder => 'Создать заказ';

  @override
  String get chat_draft_title => 'Черновик';

  @override
  String get orders => 'Заказы';

  @override
  String get errorLoadingStatuses => 'Ошибка загрузки статусов';

  @override
  String get orderDetail => 'Детали заказа';

  @override
  String dateLabel(String value) {
    return 'Дата: $value';
  }

  @override
  String sellerLabel(String name) {
    return 'Продавец: $name';
  }

  @override
  String get customer => 'Клиент';

  @override
  String get rooms => 'Комнаты';

  @override
  String corniceAndHeight(String cornice, String height) {
    return 'Карниз: $cornice м, Высота: $height м';
  }

  @override
  String get finance => 'Финансы';

  @override
  String get orders_financeTotal => 'Итого';

  @override
  String get orders_financePrepayment => 'Аванс';

  @override
  String get orders_financeBalance => 'Остаток';

  @override
  String get nameAndPhoneRequired => 'Имя и телефон обязательны';

  @override
  String errorOccurred(String message) {
    return 'Ошибка: $message';
  }

  @override
  String get newOrder => 'Новый заказ';

  @override
  String get discount => 'Скидка';

  @override
  String get amount => 'Сумма';

  @override
  String get prepayment => 'Аванс';

  @override
  String get note => 'Примечание';

  @override
  String get errorLoadingTransitions => 'Ошибка загрузки переходов';

  @override
  String get cancelled => 'Отменен';

  @override
  String get profile_languageTitle => 'Язык';

  @override
  String get profile_languageOptionUz => 'Узбекский';

  @override
  String get profile_languageOptionCyrl => 'Кириллица';

  @override
  String get profile_languageOptionRu => 'Русский';

  @override
  String get profile_themeTitle => 'Тема';

  @override
  String get profile_aboutTitle => 'О приложении';

  @override
  String get profile_aboutVersion => 'Версия';

  @override
  String get profile_aboutBuild => 'Сборка';

  @override
  String get profile_aboutEnv => 'Среда';

  @override
  String get profile_changePassword => 'Изменить пароль';

  @override
  String get profile_newPassword => 'Новый пароль';

  @override
  String get profile_confirmPassword => 'Повторите новый пароль';

  @override
  String get profile_passwordChanged => 'Пароль изменён';

  @override
  String get profile_themeSystem => 'Системная';

  @override
  String get profile_themeLight => 'Светлая';

  @override
  String get profile_themeDark => 'Тёмная';

  @override
  String get profile_logout => 'Выйти';

  @override
  String get profile_logoutConfirmTitle => 'Выйти?';

  @override
  String get profile_logoutConfirmMessage => 'Вы уверены, что хотите выйти из аккаунта?';

  @override
  String get profile_roleEmployee => 'Сотрудник';

  @override
  String get profile_roleManager => 'Менеджер';

  @override
  String get profile_roleAdmin => 'Админ';

  @override
  String get profile_roleUnknown => 'Неизвестно';

  @override
  String get profile_todaySpend => 'Расход за сегодня';

  @override
  String get profile_limitDailyReset => 'Дневной лимит обновляется в 24:00';

  @override
  String get profile_limitNotSet => 'Лимит не установлен';

  @override
  String get profile_unlimited => 'Безлимитно';

  @override
  String get currency_som => 'сум';

  @override
  String get management_periodToday => 'Сегодня';

  @override
  String get management_periodWeek => 'Неделя';

  @override
  String get management_periodMonth => 'Месяц';

  @override
  String get management_chartTitle => 'Ежедневный расход';

  @override
  String get management_usageDetails => 'Детали расхода';

  @override
  String get management_usageTokens => 'Токены';

  @override
  String get management_usageMessages => 'Сообщения';

  @override
  String get management_statsTitle => 'Статистика';

  @override
  String get management_chartEmpty => 'Нет данных для графика';

  @override
  String get management_statThreads => 'Диалоги';

  @override
  String get management_statOrders => 'Заказы';

  @override
  String get management_statConversion => 'Конверсия';

  @override
  String get management_statCost => 'Расход';

  @override
  String get management_rankingTitle => 'Рейтинг сотрудников';

  @override
  String get management_rankingEmployeeCol => 'Сотрудник';

  @override
  String get management_rankingChatsCol => 'Диалог';

  @override
  String get management_rankingCostCol => 'Расход';

  @override
  String get management_rankingOrdersCol => 'Заказ';

  @override
  String get management_sectionEmployees => 'Сотрудники';

  @override
  String get management_sectionProducts => 'Товары';

  @override
  String get management_sectionPricing => 'Правила цен';

  @override
  String get management_sectionKnowledge => 'База знаний';

  @override
  String get management_sectionSettings => 'Настройки';

  @override
  String get management_employeesTitle => 'Сотрудники';

  @override
  String get management_employeesSearchHint => 'Поиск сотрудника';

  @override
  String get management_employeeAdd => 'Добавить сотрудника';

  @override
  String management_employeeLastActive(String date) {
    return 'Последняя активность: $date';
  }

  @override
  String management_employeeTodayMeta(int chats, int messages) {
    return 'Диалоги $chats · Сообщения $messages';
  }

  @override
  String get management_employeeBlocked => 'Заблокирован';

  @override
  String get management_createTitle => 'Добавить сотрудника';

  @override
  String get management_createPhone => 'Номер телефона';

  @override
  String get management_createName => 'Имя и фамилия';

  @override
  String get management_createPassword => 'Начальный пароль';

  @override
  String get management_createRole => 'Роль';

  @override
  String get management_employeeProfileTitle => 'Профиль сотрудника';

  @override
  String get management_employeeChangePassword => 'Изменить пароль';

  @override
  String get management_employeeNewPassword => 'Новый пароль';

  @override
  String get management_employeeConfirmPassword => 'Повторите новый пароль';

  @override
  String get management_employeePasswordChanged => 'Пароль изменён';

  @override
  String get management_limitTitle => 'Дневной лимит';

  @override
  String get management_limitCost => 'Расход, сум';

  @override
  String get management_limitMessages => 'Кол-во сообщений';

  @override
  String get management_limitTokens => 'Токены';

  @override
  String get management_onExceedWarn => 'Предупреждать';

  @override
  String get management_onExceedBlock => 'Блокировать';

  @override
  String get management_limitSet => 'Сохранить лимит';

  @override
  String get management_employeeViewThreads => 'Посмотреть диалоги';

  @override
  String get management_employeeConversationsTitle => 'Диалоги сотрудника';

  @override
  String get management_employeeBlockConfirmTitle => 'Заблокировать сотрудника?';

  @override
  String get management_employeeBlockConfirmMessage =>
      'Заблокированный сотрудник не сможет войти в систему. Продолжить?';

  @override
  String get management_employeeUnblockConfirmTitle => 'Разблокировать сотрудника?';

  @override
  String get management_employeeUnblockConfirmMessage =>
      'Сотрудник снова сможет войти в систему. Продолжить?';

  @override
  String get management_conversationsEmptyTitle => 'Диалогов нет';

  @override
  String get management_conversationsEmptyMessage => 'У этого сотрудника пока нет диалогов';

  @override
  String get management_transcriptTitle => 'Транскрипт';

  @override
  String get management_transcriptEmpty => 'Нет сообщений';

  @override
  String get management_transcriptUser => 'Пользователь';

  @override
  String get management_transcriptAssistant => 'AI';

  @override
  String get management_transcriptTool => 'Инструмент';

  @override
  String get management_employeeBlock => 'Заблокировать';

  @override
  String get management_employeeUnblock => 'Разблокировать';

  @override
  String get management_employeesEmptyMessage => 'В команде пока нет сотрудников';

  @override
  String get management_employeesEmptyTitle => 'Сотрудники не найдены';

  @override
  String get management_employeesSearchEmptyMessage => 'Попробуйте другой запрос';

  @override
  String get management_employeesSearchEmptyTitle => 'Ничего не найдено';

  @override
  String get management_limitPeriodDay => 'Ежедневно';

  @override
  String get management_limitPeriodMonth => 'Ежемесячно';

  @override
  String get management_limitUnlimited => 'Без лимита';

  @override
  String get management_statsEmpty => 'Данных пока нет';

  @override
  String get management_sectionTitle => 'Разделы';

  @override
  String get management_createPhoneError => 'Введите номер телефона полностью';

  @override
  String get management_productFormTitle => 'Форма товара';

  @override
  String get management_productName => 'Название';

  @override
  String get management_productsTitle => 'Управление товарами';

  @override
  String get management_productsList => 'Список';

  @override
  String get management_knowledgeTitle => 'Правила знаний';

  @override
  String get management_knowledgeList => 'Список правил знаний';

  @override
  String get management_pricingTitle => 'Правила ценообразования';

  @override
  String get management_pricingCoefficients => 'Коэффициенты — инлайн-редактирование';

  @override
  String get management_pricingTiers => 'Таблица уровней скидок';

  @override
  String get management_pricingDefaults => 'Значения по умолчанию';

  @override
  String get management_pricingTest => 'Проверить расчёт';

  @override
  String get management_pricingCoefs => 'Коэффициенты';

  @override
  String get management_pricingServicesTitle => 'Услуги';

  @override
  String get management_pricingServicesEmpty => 'Услуги не найдены';

  @override
  String get management_pricingServiceActive => 'Активна';

  @override
  String get management_pricingServiceInactive => 'Неактивна';

  @override
  String get management_pricingServicePrice => 'Цена';

  @override
  String get management_pricingServicePriceHint => 'Введите цену услуги в сумах';

  @override
  String get management_pricingTiersTitle => 'Уровни скидок';

  @override
  String get management_pricingDefaultsTitle => 'Стандартные значения';

  @override
  String get management_pricingAddTier => 'Добавить уровень';

  @override
  String get management_pricingTierMinAmount => 'Мин. сумма';

  @override
  String get management_pricingTierPercent => 'Скидка %';

  @override
  String get management_pricingTierSave => 'Сохранить';

  @override
  String get management_pricingMaxManager => 'Макс. скидка (Менеджер)';

  @override
  String get management_pricingMaxEmployee => 'Макс. скидка (Сотрудник)';

  @override
  String get management_pricingAdvancePercent => 'Аванс %';

  @override
  String get management_pricingDeliveryPrice => 'Цена доставки';

  @override
  String get management_pricingCalcPreviewHeight => 'Высота (м)';

  @override
  String get management_pricingCalcPreviewWidth => 'Ширина (м)';

  @override
  String get management_pricingCalcPreviewPieces => 'Кол-во частей';

  @override
  String get management_pricingCalcPreviewCalc => 'Рассчитать';

  @override
  String get management_knowledgeAddRule => 'Добавить правило';

  @override
  String get management_knowledgeRuleType => 'Тип';

  @override
  String get management_knowledgeRuleConditions => 'Условия';

  @override
  String get management_knowledgeRuleRecommendation => 'Рекомендация';

  @override
  String get management_knowledgeRulePriority => 'Приоритет';

  @override
  String get management_knowledgeRuleIsActive => 'Активно';

  @override
  String get management_knowledgeRuleSave => 'Сохранить';

  @override
  String get management_knowledgeRuleTestAI => 'Тест в ИИ';

  @override
  String get management_bulkPriceTitle => 'Изменить цену';

  @override
  String get management_bulkPricePercent10 => '+10%';

  @override
  String get management_bulkPricePercent5 => '-5%';

  @override
  String get management_bulkPriceAmount => 'Новая цена';

  @override
  String get management_bulkPricePercentHint => 'Процент';

  @override
  String get management_bulkPriceAmountHint => 'Сумма';

  @override
  String get management_bulkPricePreview => 'Предпросмотр:';

  @override
  String get management_pricingPolicyHint =>
      'Максимальные лимиты ручной скидки. Предложение ИИ не превышает лимит.';

  @override
  String get management_pricingStackWithTier => 'Складывать со ступенчатой скидкой';

  @override
  String get management_pricingDeadlineDays => 'Срок (дней)';

  @override
  String get management_pricingCoefsEmpty => 'Коэффициенты не найдены';

  @override
  String get management_pricingTiersEmpty => 'Ступеней скидки пока нет';

  @override
  String get management_pricingSaveError => 'Ошибка при сохранении';

  @override
  String get management_pricingPreviewError => 'Ошибка при расчёте';

  @override
  String get management_knowledgeEditTitle => 'Редактировать правило';

  @override
  String get management_knowledgeEmptyTitle => 'Правил нет';

  @override
  String get management_knowledgeEmptyMessage => 'Пока не добавлены правила знаний';

  @override
  String get management_knowledgeErrorTitle => 'Не удалось загрузить';

  @override
  String get management_knowledgeConditionHint => 'Добавить условие';

  @override
  String get management_knowledgeRemove => 'Удалить';

  @override
  String get management_knowledgeRemoveConfirmTitle => 'Удалить правило?';

  @override
  String get management_knowledgeRemoveConfirmMessage =>
      'Правило будет удалено безвозвратно. Продолжить?';

  @override
  String get management_knowledgeRuleRemoved => 'Правило удалено';

  @override
  String get management_knowledgeRulePriorityHint => 'Приоритет';

  @override
  String management_knowledgeRulePriorityLabel(int value) {
    return 'Приоритет: $value';
  }

  @override
  String get management_productsSearchHint => 'Поиск по названию, SKU';

  @override
  String get management_productsAll => 'Все';

  @override
  String get management_productsEmptyTitle => 'Товары не найдены';

  @override
  String get management_productsEmptyMessage => 'Измените условия поиска или фильтра';

  @override
  String get management_productsLoadError => 'Не удалось загрузить';

  @override
  String get management_bulkApplied => 'Цена обновлена';

  @override
  String management_productsSelected(int count) {
    return 'Выбрано: $count';
  }

  @override
  String get management_productFormEditTitle => 'Редактирование товара';

  @override
  String get management_productFormBasic => 'Основное';

  @override
  String get management_productFormName => 'Название';

  @override
  String get management_productFormCode => 'Код';

  @override
  String get management_productFormCategory => 'Категория';

  @override
  String get management_productFormDescription => 'Описание';

  @override
  String get management_productFormFabricType => 'Тип ткани';

  @override
  String get management_productFormComposition => 'Состав';

  @override
  String get management_productFormCare => 'Уход';

  @override
  String get management_productFormSegment => 'Сегмент';

  @override
  String get management_productFormRecommendedRooms => 'Рекомендуемые комнаты';

  @override
  String get management_productFormBasePrice => 'Базовая цена';

  @override
  String get management_productFormPrice => 'Цена';

  @override
  String get management_productFormCost => 'Себестоимость';

  @override
  String get management_productFormVariants => 'Варианты';

  @override
  String get management_productFormAddVariant => 'Добавить вариант';

  @override
  String get management_productFormVariantsEmpty => 'Вариантов пока нет';

  @override
  String management_productFormVariantLabel(int index) {
    return 'Вариант $index';
  }

  @override
  String get management_productFormRemoveVariantTitle => 'Удалить вариант?';

  @override
  String get management_productFormRemoveVariantMessage => 'Это действие нельзя отменить';

  @override
  String get management_productFormRemoveVariant => 'Удалить';

  @override
  String get management_productFormSku => 'SKU';

  @override
  String get management_productFormColorName => 'Название цвета';

  @override
  String get management_productFormColorHex => 'Цвет (hex)';

  @override
  String get management_productFormWidth => 'Ширина (м)';

  @override
  String get management_productFormIsActive => 'Активен';

  @override
  String get management_productFormSaved => 'Сохранено';

  @override
  String get chat_listening => 'Слушаю...';

  @override
  String get chat_stopVoice => 'Остановить';

  @override
  String get chat_transcriptLabel => 'ТРАНСКРИПТ';

  @override
  String get chat_voiceMode => 'Голосовой режим';

  @override
  String get chat_textMode => 'Текстовый режим';

  @override
  String get chat_customerModeTitle => 'Режим клиента';

  @override
  String get chat_enterPinTitle => 'Введите ПИН код';

  @override
  String get chat_setPinTitle => 'Установите ПИН код для режима клиента';

  @override
  String get chat_confirmPinTitle => 'Подтвердите ПИН код';

  @override
  String get chat_pinMismatch => 'ПИН коды не совпадают';

  @override
  String get chat_pinIncorrect => 'Неверный ПИН код';

  @override
  String chat_pinAttemptsWait(int seconds) {
    return 'Слишком много неверных попыток. Подождите $seconds секунд.';
  }

  @override
  String pin_attemptsLeft(int count) {
    return 'Неверный ПИН код. Осталось $count попыток.';
  }

  @override
  String get chat_pdfRequireOrder => 'Сначала создайте заказ';

  @override
  String get orders_pdf => 'PDF';

  @override
  String get orders_share => 'Поделиться';

  @override
  String get settings_systemPromptTitle => 'Системный промпт';

  @override
  String get settings_currentPrompt => 'ТЕКУЩИЙ ПРОМПТ';

  @override
  String get settings_promptHint => 'Текст промпта';

  @override
  String get settings_promptEmpty => 'Промпт ещё не создан';

  @override
  String get settings_saveNewVersion => 'Сохранить новую версию';

  @override
  String get settings_versionHistory => 'ИСТОРИЯ ВЕРСИЙ';

  @override
  String settings_version(int version) {
    return 'v$version';
  }

  @override
  String get settings_rollback => 'Вернуть';

  @override
  String get settings_rollbackConfirmTitle => 'Вернуться к версии?';

  @override
  String get settings_rollbackConfirmMessage => 'Действительно вернуться к этой версии?';

  @override
  String get settings_authorUnknown => 'Неизвестно';

  @override
  String get settings_modelPricingsTitle => 'Цены моделей';

  @override
  String settings_modelProviderModel(String provider, String model) {
    return '$provider — $model';
  }

  @override
  String settings_modelInput(double price) {
    return 'Вход (1M): $price';
  }

  @override
  String settings_modelOutput(double price) {
    return 'Выход (1M): $price';
  }

  @override
  String settings_modelCached(double price) {
    return 'Кэш (1M): $price';
  }

  @override
  String settings_modelStt(double price) {
    return 'STT (мин): $price';
  }

  @override
  String settings_modelTts(double price) {
    return 'TTS (1k симв.): $price';
  }

  @override
  String settings_modelUsdToUzs(double value) {
    return 'USD → UZS: $value';
  }

  @override
  String get settings_active => 'Активен';

  @override
  String get settings_inactive => 'Неактивен';

  @override
  String get settings_delete => 'Удалить';

  @override
  String get chat_addAttachment => 'Добавить';

  @override
  String get chat_microphone => 'Микрофон';

  @override
  String get chat_send => 'Отправить';

  @override
  String get chat_draft_customer => 'Клиент';

  @override
  String get chat_draft_phone => 'Номер телефона';

  @override
  String get chat_draft_address => 'Адрес';

  @override
  String get chat_draft_missingFields => 'Поля, которые нужно заполнить';

  @override
  String get chat_draft_noMeasurements => 'Нет данных расчёта — сначала рассчитайте цену';

  @override
  String get chat_start_livingRoom_sub => 'Шторы и дизайн';

  @override
  String get chat_start_bedroom_sub => 'Темно и уютно';

  @override
  String get chat_start_couple_sub => 'Романтично и уютно';

  @override
  String get chat_start_kitchen_sub => 'Практично и светло';

  @override
  String get chat_start_kids_sub => 'Игрово и интересно';

  @override
  String get chat_start_office_sub => 'Тихо и рабоче';

  @override
  String get catalog_filterPriceFrom => 'От';

  @override
  String get catalog_filterPriceTo => 'До';

  @override
  String get common_delete => 'Удалить';

  @override
  String management_pricingTierRow(String minAmount) {
    return 'от $minAmount сум';
  }

  @override
  String get chat_quote_title => 'Расчёт';

  @override
  String get chat_quote_room => 'Комната';
}
