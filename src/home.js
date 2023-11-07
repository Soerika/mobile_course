import React from 'react';
import {View, StyleSheet, Text} from 'react-native';
import Background from './background';
import Btn from './buton';
import { darkGreen, green } from './Constants';

const Home = (props) => {
  return (
    <Background>
      <View style={{ marginHorizontal: 40, marginVertical: 100 }}>
      <Text style={{ color: 'white', fontSize: 50 }}></Text>
      <Text style={{ color: 'white', fontSize: 50, marginBottom: 40 }}>DoctorOnline</Text>
      <Btn bgColor={green} textColor='white' btnLabel="Login" Press={() => props.navigation.navigate("Login")} />
      <Btn bgColor='white' textColor={darkGreen} btnLabel="Signup" Press={() => props.navigation.navigate("Signup")} />
      </View>
    </Background>
  );
}

const styles = StyleSheet.create({})

export default Home;