*** Variables *** 
${ITEM_CATEGORY}=    //div[contains(@class, "header-text") and text()="$$"]//ancestor::span[contains(@class, "group-header")]
${ITEM_SUB_CATEGORY}=    //div[contains(@class, "header-text") and text()="$$"]//ancestor::div[contains(@class, "element-group")]//span[normalize-space()="$$"]