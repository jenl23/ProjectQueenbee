import { Flex, Text, useColorMode } from "@chakra-ui/react";
import { FC } from "react";

// @ 팀 주소 및 카피라이트에 관한 정보를 입력합니다.
const contactInfo =
  "Team Queen Bee Artists Club | 443, Teheran-ro, Gangnam-gu, Seoul, Republic of Korea | E-Mail info@qbac.com";
const copyRight = "COPYRIGHT © Team Queen Bee Artists Club. ALL RIGHT RESERVED";

const Footer: FC = () => {
  const { colorMode } = useColorMode();

  return (
    <Flex
      justifyContent="center"
      alignItems="center"
      flexDir="column"
      p={[4, 4, 2]}
      backgroundImage= "url('../images/footer.jpg')"
      minH="80px"
    >
      <Text 
        fontSize={["xs", "xs", "sm"]}
        color="white"
        textShadow= "0px 2px 5px rgb(0,0,0)"
      >{contactInfo}</Text>
      <Text fontSize="xs" mt={1} color="white" textShadow= "0px 2px 5px rgb(0,0,0)">
        {copyRight}
      </Text>
    </Flex>
  );
};

export default Footer;
