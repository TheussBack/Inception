<?php
/**
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */

/* MySQL settings */
define("DB_NAME", "inception");
define("DB_USER", "wp_user");
define("DB_PASSWORD", "wp_pass");
define("DB_HOST", "mariadb");
define("DB_CHARSET", "utf8mb4");

/* MySQL database table prefix. */
$table_prefix = "wp_";

/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define(
    "AUTH_KEY",
    'QT-]gvyC&P-<|7>omaP{.<xL:P++jF5wjnCNI#k$T$s-S1A3%p-Z+a+P-P~]iJK$'
);
define(
    "SECURE_AUTH_KEY",
    "OawvA4x-W#GMsKt9aE>=Pc7105A.<vVR9j;wt12KDQA/_</;NkB8#rcPZFwW#}D;"
);
define(
    "LOGGED_IN_KEY",
    "JIWS6Rf0_&0!KG|@X3C~%%G:!=<lFJQn+V*,q1D}|U#Yp16+%Qqj e)Q5GHkpuX#"
);
define(
    "NONCE_KEY",
    "Wt_h3|~K6ZRT+[NIr_~-`1Z&MIWz3;)-f-0md- ^g:T>y?{uyl)h-qHvTHpMDiAm"
);
define(
    "AUTH_SALT",
    "puUz~vwK_@lvM?zIV(J<~)-|;lo6tIt[O||2Z#riM9r2[M7^0),>kkO@h-JxAU;f"
);
define(
    "SECURE_AUTH_SALT",
    '}r9}f-M$lh;C*kG6@t@;`vELV^nk-G/wVB;@m6aU3+B`Cj:C)vz4@RKO--2ALRiG'
);
define(
    "LOGGED_IN_SALT",
    'T5$NJ;B{]^c;EqtPytZD5ZI<+_FXWKT6q|GOd-2,r)VO6+g~C#rIb@lq,]$EtI_2'
);
define(
    "NONCE_SALT",
    'f$>{FRs]t3 .%T,4#lqNO#3GVk;S D82M<:24DpR*m5Uc(2Gc?UP-fSe~h>Rp[}t'
);

/* Absolute path to the WordPress directory. */
if (!defined("ABSPATH")) {
    define("ABSPATH", dirname(__FILE__) . "/");
}

/* Sets up WordPress vars and included files. */
require_once ABSPATH . "wp-settings.php";