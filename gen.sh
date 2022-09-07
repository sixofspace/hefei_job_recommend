#!/bin/bash
# use this scirpt to generate README.md
# after you add your company to company.txt
# and add the logo to assets with format `logo-<company>.[png/jpg]`
# and the description to infos folder with a markdown file named
# with your company name as well.

exec &> README.md
printf "# hefei_job_recommend\r\n"
printf "🔎  合肥 企业单位（互联网+国企银行+硬件ic）工作信息分享（社招、校招、实习、避雷）\r\n"

echo '<table align="center">'
line=0
for company in `cat company.txt`;do
    [[ $((line%5)) == 0 ]] && printf "</tr><tr>\n"
    let line+=1
    logo="logo-$company.png"
    [[ -f "assets/$logo" ]] || logo="logo-$company.jpg"
    printf "  <td align=\"center\">\r\n"
    printf "    <a href=\"infos/%s.md\">\r\n" $company
    printf "      <img src=\"assets/%s\" width=\"140px\">\r\n" $logo
    printf "      <p>%s</p>\r\n" $company
    printf "    </a>\r\n"
    printf "  </td>\r\n"
done

echo '</table>'